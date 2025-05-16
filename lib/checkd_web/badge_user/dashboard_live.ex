defmodule CheckdWeb.BadgeUser.DashboardLive do
  use CheckdWeb, :live_view
  alias CheckdWeb.BadgeUser.ReadModels.Badges

  def mount(_params, _session, socket) do
    socket = assign(socket, %{
      checkd_id: "@user1234",
      my_badges: Badges.my_badges(),
      public_badges: Badges.public_badges(),
    })
    {:ok, render_with(socket, &CheckdWeb.BadgeUser.DashboardLiveTemplate.render/1)}
  end

  def handle_params(unsigned_params, _uri, socket) do
    page_params =
      case socket.assigns.live_action do
        :my_badges ->
          %{
            badges: socket.assigns.my_badges,
          }
        :my_badge ->
          %{
            badge: Enum.find(socket.assigns.my_badges, fn badge -> badge.id == unsigned_params["id"] end),
          }
        :public_badges ->
          %{
            badges: socket.assigns.public_badges,
          }
        :public_badge ->
          %{
            badge: Enum.find(socket.assigns.public_badges, fn badge -> badge.id == unsigned_params["id"] end),
          }
        _ ->
          %{}
      end

    {:noreply, assign(socket, page_params: page_params)}
  end
end
