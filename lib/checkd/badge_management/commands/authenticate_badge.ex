defmodule Checkd.BadgeManagement.Commands.AuthenticateBadge do
  use Ash.Resource, domain: Checkd.BadgeManagement
  use Commanded.Commands.Router

  dispatch __MODULE__, to: __MODULE__, identity: :user_id, identity_prefix: "#{Checkd.BadgeManagement}-"

  attributes do
    attribute :user_id, :uuid, primary_key?: true, allow_nil?: false
    attribute :badge_id, :uuid, primary_key?: true, allow_nil?: false
  end

  actions do
    create :dispatch_command do
      accept [:user_id, :badge_id]

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
    Checkd.BadgeManagement.DomainEvents.BadgeAuthenticated.create(%{
      user_id: command.user_id,
      badge_id: command.badge_id,
    })
  end

  def apply(state, _event), do: state
end
