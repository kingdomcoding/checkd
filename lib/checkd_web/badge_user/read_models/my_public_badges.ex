defmodule CheckdWeb.BadgeUser.ReadModels.MyPublicBadges do
  use Ash.Resource,
    data_layer: Ash.DataLayer.Ets,
    domain: CheckdWeb.BadgeUser.ReadModels.Domain

  attributes do
    attribute :user_id, :uuid, primary_key?: true, allow_nil?: false
    attribute :badge_id, :uuid, primary_key?: true, allow_nil?: false
    attribute :authenticated_on, :date, allow_nil?: true
  end
end
