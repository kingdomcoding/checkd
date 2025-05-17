defmodule CheckdWeb.BadgeUser.ReadModels.MyPublicBadges do
  use Ash.Resource,
    data_layer: Ash.DataLayer.Ets,
    domain: CheckdWeb.BadgeUser.ReadModels.Domain

  use Commanded.Event.Handler,
    application: Checkd.Application,
    name: __MODULE__

  attributes do
    attribute :user_id, :uuid, primary_key?: true, allow_nil?: false
    attribute :badge_id, :uuid, primary_key?: true, allow_nil?: false
  end

  actions do
    defaults [:create, :read, :destroy]
    default_accept [:user_id, :badge_id]

    read :all do
      argument :user_id, :uuid, allow_nil?: false

      filter expr(user_id == ^arg(:user_id))
    end
  end

  code_interface do
    domain CheckdWeb.BadgeUser
    define :create
    define :destroy
    define :all, args: [:user_id]
  end

  def handle(%Checkd.UserManagement.DomainEvents.UserCreated{} = event, _metadata) do
    {:ok, badges} = CheckdWeb.BadgeUser.ReadModels.Badges.read()

    Enum.each(badges, fn badge ->
      create(%{
        user_id: event.id,
        badge_id: badge.id,
      })
    end)
  end

  # TODO: When a badge is created, create a record for each user

  def handle(%Checkd.BadgeManagement.DomainEvents.BadgeAuthenticated{} = event, _metadata) do
    destroy(%{
      user_id: event.user_id,
      badge_id: event.badge_id,
    })
  end
end
