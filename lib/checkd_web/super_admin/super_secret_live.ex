defmodule CheckdWeb.SuperAdmin.SuperSecretLive do
  use CheckdWeb, :live_view

  def render(assigns) do
    ~H"""
    <div phx-click="generate-seed-badges" class="mx-auto mt-48 max-w-md p-4 text-center rounded-lg shadow sm:p-5">
        <img src={~p"/images/exclamation.svg"} class="w-32 h-32 mb-4 mx-auto" alt="Oops" />
        <p class="mb-4 text-gray-500 dark:text-gray-300">Use this only once to perfectly replicate <.link class="underline text-primary-500" target="_blank" navigate="https://app.checkd.io/wallet/badges/public">https://app.checkd.io/wallet/badges/public</.link></p>
        <div class="mt-8">
            <button class="w-full inline-flex justify-center items-center py-3 px-5 text-base font-medium text-center text-white rounded-lg bg-primary-700 hover:bg-primary-800 focus:ring-4 focus:ring-primary-300 dark:focus:ring-primary-900">
                Generate Seed Badges
                <svg class="ml-2 -mr-1 w-5 h-5" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg"><path fill-rule="evenodd" d="M10.293 3.293a1 1 0 011.414 0l6 6a1 1 0 010 1.414l-6 6a1 1 0 01-1.414-1.414L14.586 11H3a1 1 0 110-2h11.586l-4.293-4.293a1 1 0 010-1.414z" clip-rule="evenodd"></path></svg>
            </button>
        </div>
    </div>
    """
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
      |> redirect(to: ~p"/")
    }
  end
end
