defmodule Checkd.BadgeManagement.ValueObjects.Offer do
  use Ash.Resource, data_layer: :embedded

  attributes do
    attribute :embed_url, :string, allow_nil?: false
  end
end
