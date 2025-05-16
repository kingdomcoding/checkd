defmodule CheckdWeb.BadgeUser.ReadModels.Badges do
  use CheckdWeb, :verified_routes

  def public_badges() do
    [
      %{
        id: "1644aff6-e87f-4852-8b90-e65ac6fbbc72", name: "Hydrocut Run", issuer: "Hydrocut Cycling Team", image: ~p"/images/badge-fitness.svg", authentication_status: "Not authenticated",
        overview: "2k Hydrocut run"
      },
      %{
        id: "2644aff6-e87f-4852-8b90-e65ac6fbbc72", name: "CheckD Data Wallet Innovators", issuer: "Dataswyft Community", image: ~p"/images/1a0514cb-813d-4444-ad8b-4bec2b9fbb46.png", authentication_status: "Not authenticated",
        overview: "Claim this badge if you are planning to innovate on CheckD Data Wallet and discover the potential of data and badges."
      },
      %{
        id: "3644aff6-e87f-4852-8b90-e65ac6fbbc72", name: "Business Card", issuer: "Ruby Coded", image: ~p"/images/badge-fitness.svg", authentication_status: "Not authenticated",
        overview: "My card"
      },
      %{
        id: "4644aff6-e87f-4852-8b90-e65ac6fbbc72", name: "Supporter of Eat2Give SJBeacon", issuer: "The Business For Good Team", image: ~p"/images/110ad69d-badd-417d-9d1a-b06277f9bc70.jpeg", authentication_status: "Not authenticated",
        overview: "A community project by SubangFood. Dine out in Subang Jaya restaurants and every Eat2Give menu item bought will have RM3 donated to SJ Beacon. Find out more about this limited time campaign at Https://SubangFood.com/fundraising"
      },
      %{
        id: "5644aff6-e87f-4852-8b90-e65ac6fbbc72", name: "AITV", issuer: "AITV", image: ~p"/images/6530f872-71b8-4c83-92a3-9c41420292fe.jpeg", authentication_status: "Not authenticated",
        overview: "AITV is the next natural evolution of connected and smart TV."
      },
      %{
        id: "6644aff6-e87f-4852-8b90-e65ac6fbbc72", name: "Eat2Give Supporter", issuer: "Dataswyft Sdn Bhd", image: ~p"/images/110ad69d-badd-417d-9d1a-b06277f9bc70.jpeg", authentication_status: "Not authenticated",
        overview: "Support by ordering designated items at participating restaurants."
      },
      %{
        id: "7644aff6-e87f-4852-8b90-e65ac6fbbc72", name: "Dataswyft Merchant", issuer: "Dataswyft Sdn Bhd", image: ~p"/images/23734ccc-3c8b-4853-9661-10d78f3b031a.jpeg", authentication_status: "Not authenticated",
        overview: "Authenticated holders of this badge are approved / appointed Merchants by Dataswyft."
      },

      %{
        id: "8644aff6-e87f-4852-8b90-e65ac6fbbc72", name: "Donated to Eat2Give (2) times", issuer: "Dataswyft Sdn Bhd", image: ~p"/images/3fd3c89d-7053-4069-aab2-2f2c6e523ca2.jpeg", authentication_status: "Not authenticated",
        overview: "This badge verifies that the holder has donated (scanned + validated) TWO times for the Eat2Give Campaign."
      },
      %{
        id: "9644aff6-e87f-4852-8b90-e65ac6fbbc72", name: "Donated to Eat2Give (5) times", issuer: "Dataswyft Sdn Bhd", image: ~p"/images/c530653b-9b2f-486e-8394-b2ab15dba80d.jpeg", authentication_status: "Not authenticated",
        overview: "This badge verifies that the holder has donated (scanned + validated) FIVE times for the Eat2Give Campaign."
      },
      %{
        id: "0644aff6-e87f-4852-8b90-e65ac6fbbc72", name: "Dataswyft Badge Issuer", issuer: "Dataswyft Sdn Bhd", image: ~p"/images/23734ccc-3c8b-4853-9661-10d78f3b031a.jpeg", authentication_status: "Not authenticated",
        overview: "Authenticated holders of this badge are approved / verified badge issuers by Dataswyft."
      },
    ]
  end
end
