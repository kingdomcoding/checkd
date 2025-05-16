defmodule CheckdWeb.DashboardLive do
  use CheckdWeb, :live_view
  alias CheckdWeb.BadgeUser.ReadModels.Badges

  def mount(_params, _session, socket) do
    socket = assign(socket, %{
      checkd_id: "@user1234",
    })
    {:ok, render_with(socket, &CheckdWeb.DashboardLiveTemplate.render/1)}
  end

  def handle_params(_unsigned_params, _uri, socket) do
    page_params =
      case socket.assigns.live_action do
        :public_badges ->
          %{
            badges: Badges.public_badges(),
          }
        _ ->
          %{}
      end

    {:noreply, assign(socket, page_params: page_params)}
  end
end
