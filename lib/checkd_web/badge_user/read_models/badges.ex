defmodule CheckdWeb.BadgeUser.ReadModels.Badges do
  use CheckdWeb, :verified_routes

  def public_badges() do
    [
      %{name: "Hydrocut Run", issuer: "Hydrocut Cycling Team", image: ~p"/images/badge-fitness.svg"},
      %{name: "CheckD Data Wallet Innovators", issuer: "Dataswyft Community", image: ~p"/images/1a0514cb-813d-4444-ad8b-4bec2b9fbb46.png"},
      %{name: "Business Card", issuer: "Ruby Coded", image: ~p"/images/badge-fitness.svg"},
      %{name: "Supporter of Eat2Give SJBeacon", issuer: "The Business For Good Team", image: ~p"/images/110ad69d-badd-417d-9d1a-b06277f9bc70.jpeg"},
      %{name: "AITV", issuer: "AITV", image: ~p"/images/6530f872-71b8-4c83-92a3-9c41420292fe.jpeg"},
      %{name: "Eat2Give Supporter", issuer: "Dataswyft Sdn Bhd", image: ~p"/images/110ad69d-badd-417d-9d1a-b06277f9bc70.jpeg"},
      %{name: "Dataswyft Merchant", issuer: "Dataswyft Sdn Bhd", image: ~p"/images/23734ccc-3c8b-4853-9661-10d78f3b031a.jpeg"},

      %{name: "Donated to Eat2Give (2) times", issuer: "Dataswyft Sdn Bhd", image: ~p"/images/3fd3c89d-7053-4069-aab2-2f2c6e523ca2.jpeg"},
      %{name: "Donated to Eat2Give (5) times", issuer: "Dataswyft Sdn Bhd", image: ~p"/images/c530653b-9b2f-486e-8394-b2ab15dba80d.jpeg"},
      %{name: "Dataswyft Badge Issuer", issuer: "Dataswyft Sdn Bhd", image: ~p"/images/23734ccc-3c8b-4853-9661-10d78f3b031a.jpeg"},
    ]
  end
end
