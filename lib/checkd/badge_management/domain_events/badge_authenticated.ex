defmodule Checkd.BadgeManagement.DomainEvents.BadgeAuthenticated do
  use Ash.Resource, data_layer: :embedded

  @derive {Jason.Encoder, only: [:user_id, :badge_id]}

  attributes do
    attribute :user_id, :uuid, primary_key?: true, allow_nil?: false
    attribute :badge_id, :uuid, primary_key?: true, allow_nil?: false
  end

  actions do
    defaults [:create]
    default_accept [:user_id, :badge_id]
  end

  code_interface do
    domain Checkd.BadgeManagement
    define :create
  end
end
