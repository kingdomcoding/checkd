defmodule Checkd.UserManagement.Commands.CreateUser do
  use Ash.Resource, domain: Checkd.UserManagement
  use Commanded.Commands.Router

  dispatch __MODULE__, to: __MODULE__, identity: :id, identity_prefix: "#{Checkd.UserManagement}-"

  attributes do
    uuid_primary_key :id
  end

  actions do
    create :dispatch_command do

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
    Checkd.UserManagement.DomainEvents.UserCreated.create(%{id: command.id})
  end

  def apply(state, _event), do: state
end
