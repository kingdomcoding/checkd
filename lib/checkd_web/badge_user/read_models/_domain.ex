defmodule CheckdWeb.BadgeUser.ReadModels.Domain do
  use Ash.Domain

  resources do
    resource CheckdWeb.BadgeUser.ReadModels.Badges
    resource CheckdWeb.BadgeUser.ReadModels.MyBadges
    resource CheckdWeb.BadgeUser.ReadModels.MyPublicBadges
  end

end
