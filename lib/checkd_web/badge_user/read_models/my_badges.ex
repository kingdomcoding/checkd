defmodule CheckdWeb.BadgeUser.ReadModels.MyBadges do
  use Ash.Resource,
    data_layer: Ash.DataLayer.Ets,
    domain: CheckdWeb.BadgeUser.ReadModels.Domain

  attributes do
    attribute :user_id, :uuid, primary_key?: true, allow_nil?: false
    attribute :badge_id, :uuid, primary_key?: true, allow_nil?: false
    attribute :authenticated_on, :date, allow_nil?: true
    attribute :validation_count, :integer, allow_nil?: false, default: 0
  end
end
