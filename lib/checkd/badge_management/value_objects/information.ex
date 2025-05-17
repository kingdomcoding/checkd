defmodule Checkd.BadgeManagement.ValueObjects.Information do
  use Ash.Resource, data_layer: :embedded

  @derive {Jason.Encoder, only: [:title, :description, :image, :voucher_code]}

  attributes do
    attribute :title, :string, allow_nil?: false, public?: true
    attribute :description, :string, allow_nil?: false, public?: true
    attribute :image, :string, allow_nil?: false, public?: true
    attribute :voucher_code, :string, public?: true
  end
end
