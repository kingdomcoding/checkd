defmodule CheckdWeb.BadgeUser.ReadModels.Domain do
  use Ash.Domain
  use Supervisor

  def start_link(arg) do
    Supervisor.start_link(__MODULE__, arg, name: __MODULE__)
  end

  @impl true
  def init(_arg) do
    children = [
      CheckdWeb.BadgeUser.ReadModels.Badges,
      CheckdWeb.BadgeUser.ReadModels.MyBadges,
      CheckdWeb.BadgeUser.ReadModels.MyPublicBadges,
    ]

    Supervisor.init(children, strategy: :one_for_one)
  end

  resources do
    resource CheckdWeb.BadgeUser.ReadModels.Badges
    resource CheckdWeb.BadgeUser.ReadModels.MyBadges
    resource CheckdWeb.BadgeUser.ReadModels.MyPublicBadges
  end
end
