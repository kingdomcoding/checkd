defmodule Checkd.BadgeManagement.Commands.CreatePublicBadge do
  use Ash.Resource, domain: Checkd.BadgeManagement
  use Commanded.Commands.Router

  dispatch __MODULE__, to: __MODULE__, identity: :id, identity_prefix: "#{Checkd.BadgeManagement}-"

  attributes do
    uuid_primary_key :id
    attribute :name, :string, allow_nil?: false
    attribute :issuer, :string, allow_nil?: false
    attribute :image, :string, allow_nil?: false
    attribute :overview, :string, allow_nil?: false
    attribute :information, Checkd.BadgeManagement.ValueObjects.Information
    attribute :offer, Checkd.BadgeManagement.ValueObjects.Offer
  end

  actions do
    create :dispatch_command do
      accept [:name, :issuer, :image, :overview, :information, :offer]

      change fn changeset, _context ->
        Ash.Changeset.after_action(changeset, fn _changeset, command ->
          with :ok <- __MODULE__.dispatch(command, application: Checkd.Application) do
            {:ok, command}
          end
        end)
      end
    end
  end

  def execute(_state, %{__struct__: __MODULE__} = command) do
    Checkd.BadgeManagement.DomainEvents.PublicBadgeCreated.create(%{
      id: command.id,
      name: command.name,
      issuer: command.issuer,
      image: command.image,
      overview: command.overview,
      information: command.information,
      offer: command.offer
    })
  end

  def apply(state, _event), do: state
end
