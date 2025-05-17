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
    attribute :authenticated_on, :date, allow_nil?: true
  end

  actions do
    defaults [:create, :read]
    default_accept [:user_id, :badge_id, :authenticated_on]
  end

  code_interface do
    domain CheckdWeb.BadgeUser
    define :create
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
end
