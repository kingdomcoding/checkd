defmodule CheckdWeb.BadgeUser.DashboardLive do
  use CheckdWeb, :live_view

  def mount(_params, _session, socket) do
    # TODO: Replace with proper authentication
    # {:ok, %{id: user_id}} = Checkd.UserManagement.create_user()
    # |> dbg()

    user_id = "3d4f09c7-2d2e-4acc-aea8-0ca303e9013a"

    CheckdWeb.Endpoint.subscribe("badge_user:my_public_badges:changed:#{user_id}")
    CheckdWeb.Endpoint.subscribe("badge_user:my_badges:changed:#{user_id}")

    # {:ok, _} = Checkd.BadgeManagement.authenticate_badge(%{user_id: "3d4f09c7-2d2e-4acc-aea8-0ca303e9013a", badge_id: "f09b03db-3559-4f44-8ca7-a8a38b1336f8"})

    socket = assign(socket, %{
      user_id: user_id,
      checkd_id: checkd_id(user_id),
      my_badges: my_badges(user_id),
      public_badges: public_badges(user_id),
    })

    {:ok, render_with(socket, &CheckdWeb.BadgeUser.DashboardLiveTemplate.render/1)}

    {:ok, socket}
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

      socket = render_with(socket, &CheckdWeb.BadgeUser.DashboardLiveTemplate.render/1)

    {:noreply, assign(socket, page_params: page_params)}
  end

  def handle_info(%Phoenix.Socket.Broadcast{payload: %{resource: CheckdWeb.BadgeUser.ReadModels.MyPublicBadges}} = _message, socket) do
    socket = assign(socket, %{public_badges: public_badges(socket.assigns.user_id)})
    {:noreply, socket}
  end

  def handle_info(%Phoenix.Socket.Broadcast{payload: %{resource: CheckdWeb.BadgeUser.ReadModels.MyBadges}} = _message, socket) do
    socket = assign(socket, %{my_badges: my_badges(socket.assigns.user_id)})
    {:noreply, socket}
  end

  def checkd_id(user_id) do
    "@user#{String.slice(user_id, 0, 4)}"
  end

  def my_badges(user_id) do
    {:ok, badges} = CheckdWeb.BadgeUser.ReadModels.MyBadges.all(user_id)

    Enum.map(badges, fn badge ->
      authentication_status =
        if badge.authenticated_on do
          "Authenticated on #{badge.authenticated_on.month} #{badge.authenticated_on.day}, #{badge.authenticated_on.year}"
        else
          "Not authenticated"
        end

      %{
        id: badge.badge.id,
        name: badge.badge.name,
        issuer: badge.badge.issuer,
        image: badge.badge.image,
        authenticated_on: badge.authenticated_on,
        authentication_status: authentication_status,
        overview: badge.badge.overview,
        information: badge.badge.information,
        offer: badge.badge.offer,
        validation: %{
          url: "https://example.com/validate/#{badge.badge.id}",
          count: badge.validation_count,
        }
      }
    end)
  end

  def public_badges(user_id) do
    {:ok, badges} = CheckdWeb.BadgeUser.ReadModels.MyPublicBadges.all(user_id)

    Enum.map(badges, fn badge ->
      %{
        id: badge.badge.id,
        name: badge.badge.name,
        issuer: badge.badge.issuer,
        image: badge.badge.image,
        authenticated_on: nil,
        authentication_status: "Not authenticated",
        overview: badge.badge.overview,
        information: badge.badge.information,
        offer: badge.badge.offer
      }
    end)
  end
end
