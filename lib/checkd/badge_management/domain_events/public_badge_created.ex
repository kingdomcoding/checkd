defmodule Checkd.BadgeManagement.DomainEvents.PublicBadgeCreated do
  use Ash.Resource, data_layer: :embedded

  @derive {Jason.Encoder, only: [:id, :name, :issuer, :image, :overview, :information, :offer]}

  attributes do
    attribute :id, :uuid, primary_key?: true, allow_nil?: false
    attribute :name, :string, allow_nil?: false
    attribute :issuer, :string, allow_nil?: false
    attribute :image, :string, allow_nil?: false
    attribute :overview, :string, allow_nil?: false
    attribute :information, Checkd.BadgeManagement.ValueObjects.Information
    attribute :offer, Checkd.BadgeManagement.ValueObjects.Offer
  end

  actions do
    defaults [:create]
    default_accept [:id, :name, :issuer, :image, :overview, :information, :offer]
  end

  code_interface do
    domain Checkd.BadgeManagement
    define :create
  end
end
