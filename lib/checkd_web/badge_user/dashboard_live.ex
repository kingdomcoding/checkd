defmodule CheckdWeb.BadgeUser.DashboardLive do
  use CheckdWeb, :live_view

  def mount(_params, session, socket) do
    user_id = Map.get(session, "user_id")

    socket = assign(socket, %{user_id: user_id})

    if user_id == nil do
      {:ok, render_with(socket, &CheckdWeb.BadgeUser.SignedOutDashboardLiveTemplate.render/1)}
    else
      CheckdWeb.Endpoint.subscribe("badge_user:my_public_badges:changed:#{user_id}")
      CheckdWeb.Endpoint.subscribe("badge_user:my_badges:changed:#{user_id}")

      socket = assign(socket, %{
        user_id: user_id,
        checkd_id: checkd_id(user_id),
        my_badges: my_badges(user_id),
        public_badges: public_badges(user_id),
      })

      {:ok, render_with(socket, &CheckdWeb.BadgeUser.DashboardLiveTemplate.render/1)}
    end
  end

  def handle_params(unsigned_params, _uri, socket) do
    if socket.assigns.user_id == nil do
      {:noreply, socket}
    else
      socket =
        socket
        |> assign(query_params: unsigned_params)
        |> update_page_params()

      {:noreply, socket}
    end
  end

  def update_page_params(socket) do
    page_params =
      case socket.assigns.live_action do
        :my_badges ->
          %{
            badges: socket.assigns.my_badges,
          }
        :my_badge ->
          %{
            badge: Enum.find(socket.assigns.my_badges, fn badge -> badge.id == socket.assigns.query_params["id"] end),
          }
        :public_badges ->
          %{
            badges: socket.assigns.public_badges,
          }
        :public_badge ->
          %{
            badge: Enum.find(socket.assigns.public_badges, fn badge -> badge.id == socket.assigns.query_params["id"] end),
          }
        _ ->
          %{}
      end

    assign(socket, page_params: page_params)
  end

  def handle_event("generate-seed-badges", _unsigned_params, socket) do
    badges = [
      %{
        name: "Hydrocut Run", issuer: "Hydrocut Cycling Team", image: ~p"/images/badge-fitness.svg",
        overview: "2k Hydrocut run", information: %{
          image: ~p"/images/badge-fitness.svg",
          title: "Hydrocut Run",
          voucher_code: nil,
          description: "Hydrocut Run"
        }, offer: nil,
      },
      %{
        name: "CheckD Data Wallet Innovators", issuer: "Dataswyft Community", image: ~p"/images/1a0514cb-813d-4444-ad8b-4bec2b9fbb46.png",
        overview: "Claim this badge if you are planning to innovate on CheckD Data Wallet and discover the potential of data and badges.", information: %{
          image: ~p"/images/badge-fitness.svg",
          title: "Free drinks at designated pubs. More offers to come.",
          voucher_code: nil,
          description: "Show this badge at designated pubs to get a thank you drink from Dataswyft."
        }, offer: nil,
      },
      %{
        name: "Business Card", issuer: "Ruby Coded", image: ~p"/images/badge-fitness.svg",
        overview: "My card", information: nil, offer: nil,
      },
      %{
        name: "Supporter of Eat2Give SJBeacon", issuer: "The Business For Good Team", image: ~p"/images/110ad69d-badd-417d-9d1a-b06277f9bc70.jpeg",
        overview: "A community project by SubangFood. Dine out in Subang Jaya restaurants and every Eat2Give menu item bought will have RM3 donated to SJ Beacon. Find out more about this limited time campaign at Https://SubangFood.com/fundraising", information: %{
          image: ~p"/images/a92c1f4a-02c0-4bef-96d0-264e2de3829d.jpeg",
          title: "F&B places to support this Eat2Give SJBeacon campaign",
          voucher_code: nil,
          description: "Find for the list of F&B at https://subangfood.com/fundraising"
        }, offer: nil
      },
      %{
        name: "AITV", issuer: "AITV", image: ~p"/images/6530f872-71b8-4c83-92a3-9c41420292fe.jpeg",
        overview: "AITV is the next natural evolution of connected and smart TV.", information: %{
          image: ~p"/images/f0534612-0525-4710-84a3-be0568efed61.jpeg",
          title: "AITV Service Providers",
          voucher_code: "AITV",
          description: "Join AITV Team. DIscover what's possible and how through interactive TV we can bring new experiences like never before."
        }, offer: nil
      },
      %{
        name: "Eat2Give Supporter", issuer: "Dataswyft Sdn Bhd", image: ~p"/images/110ad69d-badd-417d-9d1a-b06277f9bc70.jpeg",
        overview: "Support by ordering designated items at participating restaurants.", information: nil, offer: %{embed_url: "https://www.checkd.io/eat2give"}
      },
      %{
        name: "Dataswyft Merchant", issuer: "Dataswyft Sdn Bhd", image: ~p"/images/23734ccc-3c8b-4853-9661-10d78f3b031a.jpeg",
        overview: "Authenticated holders of this badge are approved / appointed Merchants by Dataswyft.", information: nil, offer: nil
      },
      %{
        name: "Donated to Eat2Give (2) times", issuer: "Dataswyft Sdn Bhd", image: ~p"/images/3fd3c89d-7053-4069-aab2-2f2c6e523ca2.jpeg",
        overview: "This badge verifies that the holder has donated (scanned + validated) TWO times for the Eat2Give Campaign.", information: nil, offer: nil
      },
      %{
        name: "Donated to Eat2Give (5) times", issuer: "Dataswyft Sdn Bhd", image: ~p"/images/c530653b-9b2f-486e-8394-b2ab15dba80d.jpeg",
        overview: "This badge verifies that the holder has donated (scanned + validated) FIVE times for the Eat2Give Campaign.", information: nil, offer: nil
      },
      %{
        name: "Dataswyft Badge Issuer", issuer: "Dataswyft Sdn Bhd", image: ~p"/images/23734ccc-3c8b-4853-9661-10d78f3b031a.jpeg",
        overview: "Authenticated holders of this badge are approved / verified badge issuers by Dataswyft.", information: nil, offer: nil
      },
    ]

    Enum.each(badges, fn badge ->
      {:ok, _} =
        Checkd.BadgeManagement.create_public_badge(%{
          name: badge.name,
          issuer: badge.issuer,
          image: badge.image,
          overview: badge.overview,
          information: badge.information,
          offer: badge.offer
        })
    end)

    {:noreply,
      socket
      |> put_flash(:info, "Seed badges generated successfully.")
    }
  end

  def handle_event("authenticate-badge", %{"badge_id" => badge_id}, socket) do
    {:ok, _} = Checkd.BadgeManagement.authenticate_badge(%{user_id: socket.assigns.user_id, badge_id: badge_id})

    {:noreply,
      socket
      |> redirect(to: ~p"/")
      |> put_flash(:info, "Badge authenticated successfully.")
    }
  end

  def handle_info(%Phoenix.Socket.Broadcast{payload: %{resource: CheckdWeb.BadgeUser.ReadModels.MyPublicBadges}} = _message, socket) do
    socket =
      socket
      |> assign(%{public_badges: public_badges(socket.assigns.user_id)})
      |> update_page_params()

    {:noreply, socket}
  end

  def handle_info(%Phoenix.Socket.Broadcast{payload: %{resource: CheckdWeb.BadgeUser.ReadModels.MyBadges}} = _message, socket) do
    socket =
      socket
      |> assign(%{my_badges: my_badges(socket.assigns.user_id)})
      |> update_page_params()

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
          "Authenticated on #{Timex.month_name(badge.authenticated_on.month)} #{badge.authenticated_on.day}, #{badge.authenticated_on.year}"
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
