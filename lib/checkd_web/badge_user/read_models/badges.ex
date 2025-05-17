defmodule CheckdWeb.BadgeUser.ReadModels.Badges do
  use Ash.Resource,
    data_layer: Ash.DataLayer.Ets,
    domain: CheckdWeb.BadgeUser.ReadModels.Domain

  attributes do
    attribute :id, :uuid, primary_key?: true, allow_nil?: false
    attribute :name, :string, allow_nil?: false
    attribute :issuer, :string, allow_nil?: false
    attribute :image, :string, allow_nil?: false
    attribute :overview, :string, allow_nil?: false
    attribute :information, Checkd.BadgeManagement.ValueObjects.Information
    attribute :offer, Checkd.BadgeManagement.ValueObjects.Offer
  end
end
