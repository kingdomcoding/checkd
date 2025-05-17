defmodule Checkd.UserManagement.DomainEvents.UserCreated do
  use Ash.Resource, data_layer: :embedded

  @derive {Jason.Encoder, only: [:id]}

  attributes do
    attribute :id, :uuid, primary_key?: true, allow_nil?: false
  end

  actions do
    defaults [:create]
    default_accept [:id]
  end

  code_interface do
    domain Checkd.UserManagement
    define :create
  end
end
