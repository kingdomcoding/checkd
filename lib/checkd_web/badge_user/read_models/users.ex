defmodule CheckdWeb.BadgeUser.ReadModels.Users do
  use Ash.Resource,
    data_layer: Ash.DataLayer.Ets,
    domain: CheckdWeb.BadgeUser.ReadModels.Domain

  use Commanded.Event.Handler,
    application: Checkd.Application,
    name: __MODULE__

  attributes do
    attribute :id, :uuid, primary_key?: true, allow_nil?: false
  end

  actions do
    defaults [:create, :read]
    default_accept [:id]
  end

  code_interface do
    domain CheckdWeb.BadgeUser
    define :create
    define :read
  end

  def handle(%Checkd.UserManagement.DomainEvents.UserCreated{} = event, _metadata) do
    create(%{id: event.id})
  end
end
