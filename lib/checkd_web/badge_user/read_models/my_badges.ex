defmodule CheckdWeb.BadgeUser.ReadModels.MyBadges do
  use Ash.Resource,
    data_layer: Ash.DataLayer.Ets,
    notifiers: [Ash.Notifier.PubSub],
    domain: CheckdWeb.BadgeUser.ReadModels.Domain

  use Commanded.Event.Handler,
    application: Checkd.Application,
    name: __MODULE__

  attributes do
    attribute :user_id, :uuid, primary_key?: true, allow_nil?: false
    attribute :badge_id, :uuid, primary_key?: true, allow_nil?: false
    attribute :authenticated_on, :date, allow_nil?: true
    attribute :validation_count, :integer, allow_nil?: false, default: 0
  end

  relationships do
    belongs_to :badge, CheckdWeb.BadgeUser.ReadModels.Badges do
      source_attribute :badge_id
      destination_attribute :id
    end
  end

  actions do
    defaults [:create, :read]
    default_accept [:user_id, :badge_id, :authenticated_on, :validation_count]

    read :all do
      argument :user_id, :uuid, allow_nil?: false

      filter expr(user_id == ^arg(:user_id))

      prepare fn query, _ ->
        query
        |> Ash.Query.load([:badge])
      end
    end
  end

  code_interface do
    domain CheckdWeb.BadgeUser
    define :create
    define :all, args: [:user_id]
  end

  pub_sub do
    prefix "badge_user:my_badges"
    module CheckdWeb.Endpoint

    publish :create, ["changed", :user_id]
  end

  def handle(%Checkd.BadgeManagement.DomainEvents.BadgeAuthenticated{} = event, %{created_at: authentication_datetime} = _metadata) do
    create(%{
      user_id: event.user_id,
      badge_id: event.badge_id,
      authenticated_on: DateTime.to_date(authentication_datetime),
    })
  end
end
