defmodule CheckdWeb.BadgeUser.DashboardLive do
  use CheckdWeb, :live_view
  alias CheckdWeb.BadgeUser.ReadModels.Badges

  def mount(_params, _session, socket) do
    socket = assign(socket, %{
      checkd_id: "@user1234",
      badges: Badges.public_badges(),
    })
    {:ok, render_with(socket, &CheckdWeb.BadgeUser.DashboardLiveTemplate.render/1)}
  end

  def handle_params(unsigned_params, _uri, socket) do
    page_params =
      case socket.assigns.live_action do
        :public_badges ->
          %{
            badges: socket.assigns.badges,
          }
        :public_badge ->
          %{
            badge: Enum.find(socket.assigns.badges, fn badge -> badge.id == unsigned_params["id"] end),
          }
        _ ->
          %{}
      end

    {:noreply, assign(socket, page_params: page_params)}
  end
end
