defmodule Checkd.BadgeManagement do
  use Ash.Domain

  resources do
    resource Checkd.BadgeManagement.Commands.CreatePublicBadge do
      define :create_public_badge, action: :dispatch_command
    end
  end
end
