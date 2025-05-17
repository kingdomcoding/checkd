defmodule Checkd.UserManagement do
  use Ash.Domain

  resources do
    resource Checkd.UserManagement.Commands.CreateUser do
      define :create_user, action: :dispatch_command
    end
  end
end
