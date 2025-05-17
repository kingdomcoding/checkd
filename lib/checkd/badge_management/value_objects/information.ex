defmodule Checkd.BadgeManagement.ValueObjects.Information do
  use Ash.Resource, data_layer: :embedded

  attributes do
    attribute :title, :string, allow_nil?: false
    attribute :description, :string, allow_nil?: false
    attribute :image, :string, allow_nil?: false
    attribute :voucher_code, :string
  end
end
