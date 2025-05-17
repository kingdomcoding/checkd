defmodule CheckdWeb.BadgeUser.ReadModels.Badges do
  use Ash.Resource,
    data_layer: Ash.DataLayer.Ets,
    domain: CheckdWeb.BadgeUser.ReadModels.Domain

  use Commanded.Event.Handler,
    application: Checkd.Application,
    name: __MODULE__

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
    defaults [:create, :read]
    default_accept [:id, :name, :issuer, :image, :overview, :information, :offer]
  end

  code_interface do
    domain CheckdWeb.BadgeUser
    define :create
  end

  def handle(%Checkd.BadgeManagement.DomainEvents.PublicBadgeCreated{} = event, _metadata) do
    create(%{
      id: event.id,
      name: event.name,
      issuer: event.issuer,
      image: event.image,
      overview: event.overview,
      information: event.information,
      offer: event.offer
    })
  end
end
