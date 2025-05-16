defmodule CheckdWeb.DashboardLive do
  use CheckdWeb, :live_view

  def mount(_params, _session, socket) do
    socket = assign(socket, %{
      checkd_id: "@user1234",
    })
    {:ok, render_with(socket, &CheckdWeb.DashboardLiveTemplate.render/1)}
  end
end
