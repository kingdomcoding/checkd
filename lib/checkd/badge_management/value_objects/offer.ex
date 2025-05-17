defmodule Checkd.BadgeManagement.ValueObjects.Offer do
  use Ash.Resource, data_layer: :embedded

  @derive {Jason.Encoder, only: [:embed_url]}

  attributes do
    attribute :embed_url, :string, allow_nil?: false, public?: true
  end
end
