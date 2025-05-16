defmodule CheckdWeb.DashboardLive do
  use CheckdWeb, :live_view

  def mount(_params, _session, socket) do
    {:ok, render_with(socket, &CheckdWeb.DashboardLiveTemplate.render/1)}
  end
end
