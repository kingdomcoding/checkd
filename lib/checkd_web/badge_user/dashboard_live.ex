defmodule CheckdWeb.BadgeUser.DashboardLive do
  use CheckdWeb, :live_view

  def mount(_params, _session, socket) do
    socket = assign(socket, %{
      checkd_id: "@user1234",
      my_badges: my_badges(),
      public_badges: public_badges(),
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

  def my_badges() do
    [
      %{
        id: "1644aff6-e87f-4852-8b90-e65ac6fbbc72", name: "Hydrocut Run", issuer: "Hydrocut Cycling Team", image: ~p"/images/badge-fitness.svg",
        authenticated_on: nil, authentication_status: "Not authenticated",
        overview: "2k Hydrocut run", information: %{
          image: ~p"/images/badge-fitness.svg",
          title: "Hydrocut Run",
          voucher_code: nil,
          description: "Hydrocut Run"
        }, offer: nil,
        validation: %{url: "https://example.com/validate/1644aff6-e87f-4852-8b90-e65ac6fbbc72", count: 0},
      },
      %{
        id: "2644aff6-e87f-4852-8b90-e65ac6fbbc72", name: "CheckD Data Wallet Innovators", issuer: "Dataswyft Community", image: ~p"/images/1a0514cb-813d-4444-ad8b-4bec2b9fbb46.png",
        authenticated_on: nil, authentication_status: "Not authenticated",
        overview: "Claim this badge if you are planning to innovate on CheckD Data Wallet and discover the potential of data and badges.", information: %{
          image: ~p"/images/badge-fitness.svg",
          title: "Free drinks at designated pubs. More offers to come.",
          voucher_code: nil,
          description: "Show this badge at designated pubs to get a thank you drink from Dataswyft."
        }, offer: nil,
        validation: %{url: "https://example.com/validate/2644aff6-e87f-4852-8b90-e65ac6fbbc72", count: 0},
      },
      %{
        id: "3644aff6-e87f-4852-8b90-e65ac6fbbc72", name: "Business Card", issuer: "Ruby Coded", image: ~p"/images/badge-fitness.svg",
        authenticated_on: ~D[2025-05-16], authentication_status: "Authenticated on May 16, 2025",
        overview: "My card", information: nil, offer: nil,
        validation: %{url: "https://example.com/validate/3644aff6-e87f-4852-8b90-e65ac6fbbc72", count: 0},
      },
    ]
  end

  def public_badges() do
    [
      %{
        id: "4644aff6-e87f-4852-8b90-e65ac6fbbc72", name: "Supporter of Eat2Give SJBeacon", issuer: "The Business For Good Team", image: ~p"/images/110ad69d-badd-417d-9d1a-b06277f9bc70.jpeg",
        authenticated_on: nil, authentication_status: "Not authenticated",
        overview: "A community project by SubangFood. Dine out in Subang Jaya restaurants and every Eat2Give menu item bought will have RM3 donated to SJ Beacon. Find out more about this limited time campaign at Https://SubangFood.com/fundraising", information: %{
          image: ~p"/images/a92c1f4a-02c0-4bef-96d0-264e2de3829d.jpeg",
          title: "F&B places to support this Eat2Give SJBeacon campaign",
          voucher_code: nil,
          description: "Find for the list of F&B at https://subangfood.com/fundraising"
        }, offer: nil
      },
      %{
        id: "5644aff6-e87f-4852-8b90-e65ac6fbbc72", name: "AITV", issuer: "AITV", image: ~p"/images/6530f872-71b8-4c83-92a3-9c41420292fe.jpeg",
        authenticated_on: nil, authentication_status: "Not authenticated",
        overview: "AITV is the next natural evolution of connected and smart TV.", information: %{
          image: ~p"/images/f0534612-0525-4710-84a3-be0568efed61.jpeg",
          title: "AITV Service Providers",
          voucher_code: "AITV",
          description: "Join AITV Team. DIscover what's possible and how through interactive TV we can bring new experiences like never before."
        }, offer: nil
      },
      %{
        id: "6644aff6-e87f-4852-8b90-e65ac6fbbc72", name: "Eat2Give Supporter", issuer: "Dataswyft Sdn Bhd", image: ~p"/images/110ad69d-badd-417d-9d1a-b06277f9bc70.jpeg",
        authenticated_on: nil, authentication_status: "Not authenticated",
        overview: "Support by ordering designated items at participating restaurants.", information: nil, offer: %{embed_url: "https://www.checkd.io/eat2give"}
      },
      %{
        id: "7644aff6-e87f-4852-8b90-e65ac6fbbc72", name: "Dataswyft Merchant", issuer: "Dataswyft Sdn Bhd", image: ~p"/images/23734ccc-3c8b-4853-9661-10d78f3b031a.jpeg",
        authenticated_on: nil, authentication_status: "Not authenticated",
        overview: "Authenticated holders of this badge are approved / appointed Merchants by Dataswyft.", information: nil, offer: nil
      },

      %{
        id: "8644aff6-e87f-4852-8b90-e65ac6fbbc72", name: "Donated to Eat2Give (2) times", issuer: "Dataswyft Sdn Bhd", image: ~p"/images/3fd3c89d-7053-4069-aab2-2f2c6e523ca2.jpeg",
        authenticated_on: nil, authentication_status: "Not authenticated",
        overview: "This badge verifies that the holder has donated (scanned + validated) TWO times for the Eat2Give Campaign.", information: nil, offer: nil
      },
      %{
        id: "9644aff6-e87f-4852-8b90-e65ac6fbbc72", name: "Donated to Eat2Give (5) times", issuer: "Dataswyft Sdn Bhd", image: ~p"/images/c530653b-9b2f-486e-8394-b2ab15dba80d.jpeg",
        authenticated_on: nil, authentication_status: "Not authenticated",
        overview: "This badge verifies that the holder has donated (scanned + validated) FIVE times for the Eat2Give Campaign.", information: nil, offer: nil
      },
      %{
        id: "0644aff6-e87f-4852-8b90-e65ac6fbbc72", name: "Dataswyft Badge Issuer", issuer: "Dataswyft Sdn Bhd", image: ~p"/images/23734ccc-3c8b-4853-9661-10d78f3b031a.jpeg",
        authenticated_on: nil, authentication_status: "Not authenticated",
        overview: "Authenticated holders of this badge are approved / verified badge issuers by Dataswyft.", information: nil, offer: nil
      },
    ]
  end
end
