defmodule CheckdWeb.BadgeUser.DashboardLiveTemplate do
  use CheckdWeb, :html

  def render(assigns) do
    ~H"""
    <.sidebar live_action={@live_action} checkd_id={@checkd_id} />
    <.main live_action={@live_action} page_params={@page_params} />
    """
  end

  def main(%{live_action: :public_badges} = assigns) do
    ~H"""
    <.badges_layout>
        <:title>Public Badges</:title>
        <:subtitle>Browse the list of publicly available badges to add to your collection. Discover badges that match your interests and aspirations.</:subtitle>
        <:content>
            <.empty_state :if={@page_params.badges == []}>
                <:title>Oops! No badges found.</:title>
                <:subtitle>It seems like there are no public badges available at the moment. Please check back later or explore other sections of the app.</:subtitle>
                <:action>
                </:action>
            </.empty_state>

            <div class="grid grid-cols-1 gap-4 mt-8 lg:mt-16 sm:grid-cols-2 md:grid-cols-3 xl:grid-cols-4">
                <.link navigate={~p"/public-badges/#{badge.id}"} :for={badge <- @page_params.badges} class="relative overflow-hidden rounded-lg group">
                    <img class="object-cover w-full h-[320px] lg:h-auto scale-100 ease-in duration-300 group-hover:scale-125" src={badge.image} alt="">
                    <div class="absolute inset-0 grid items-end justify-center p-4 bg-gradient-to-b from-transparent to-black/60">
                    <div class="text-center">
                        <p class="text-xl font-bold text-white">
                        {badge.name}
                        </p>
                        <p class="text-base font-medium text-gray-300">
                        {badge.issuer}
                        </p>
                    </div>
                    </div>
                </.link>
            </div>
        </:content>
    </.badges_layout>
    """
  end

  def main(%{live_action: :public_badge} = assigns) do
    ~H"""
    <.badge_layout image={@page_params.badge.image}>
        <:name>{@page_params.badge.name}</:name>
        <:issuer>{@page_params.badge.issuer}</:issuer>
        <:authentication_status>{@page_params.badge.authentication_status}</:authentication_status>
        <:overview>{@page_params.badge.overview}</:overview>
        <:action_area>
            <div class="mt-4 flex flex-col mb-8 lg:mb-16 space-y-4 sm:flex-row sm:space-y-0 sm:space-x-4">
                <a href="#" class="w-full inline-flex justify-center items-center py-3 px-5 text-base font-medium text-center text-white rounded-lg bg-primary-700 hover:bg-primary-800 focus:ring-4 focus:ring-primary-300 dark:focus:ring-primary-900">
                    Authenticate
                    <svg class="ml-2 -mr-1 w-5 h-5" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg"><path fill-rule="evenodd" d="M10.293 3.293a1 1 0 011.414 0l6 6a1 1 0 010 1.414l-6 6a1 1 0 01-1.414-1.414L14.586 11H3a1 1 0 110-2h11.586l-4.293-4.293a1 1 0 010-1.414z" clip-rule="evenodd"></path></svg>
                </a>
                <a href="#" class="w-full inline-flex justify-center items-center py-3 px-5 text-base font-medium text-center text-gray-900 rounded-lg border border-gray-300 hover:bg-gray-100 focus:ring-4 focus:ring-gray-100 dark:text-white dark:border-gray-700 dark:hover:bg-gray-700 dark:focus:ring-gray-800">
                    View Information
                </a>
            </div>
        </:action_area>
    </.badge_layout>
    """
  end

  def main(assigns) do
    ~H"""
    """
  end

  def sidebar(assigns) do
    ~H"""
    <button data-drawer-target="sidebar-info" data-drawer-toggle="sidebar-info" aria-controls="sidebar-info" type="button" class="inline-flex items-center p-2 mt-2 ml-3 text-sm text-gray-500 rounded-lg sm:hidden hover:bg-gray-100 focus:outline-none focus:ring-2 focus:ring-gray-200 dark:text-gray-400 dark:hover:bg-gray-700 dark:focus:ring-gray-600">
      <span class="sr-only">Open sidebar</span>
      <svg class="w-6 h-6" aria-hidden="true" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg">
          <path clip-rule="evenodd" fill-rule="evenodd" d="M2 4.75A.75.75 0 012.75 4h14.5a.75.75 0 010 1.5H2.75A.75.75 0 012 4.75zm0 10.5a.75.75 0 01.75-.75h7.5a.75.75 0 010 1.5h-7.5a.75.75 0 01-.75-.75zM2 10a.75.75 0 01.75-.75h14.5a.75.75 0 010 1.5H2.75A.75.75 0 012 10z"></path>
      </svg>
    </button>

    <aside id="sidebar-info" class="fixed top-0 left-0 z-40 w-64 h-screen transition-transform -translate-x-full sm:translate-x-0" aria-label="Sidebar">
        <div class="overflow-y-auto py-4 px-3 h-full bg-white border-r border-gray-200 dark:bg-gray-800 dark:border-gray-700">
            <div class="text-center text-gray-500 dark:text-gray-400">
                <img class="mx-auto mb-4 w-20 h-20 rounded-full" src={~p"/images/blank-user.svg"} alt="Micheal Avatar">
                <h3 class="text-xl font-bold tracking-tight text-gray-900 dark:text-white">
                    <a href="#">CheckD User</a>
                </h3>
                <p class="font-light text-gray-500 dark:text-gray-400">{@checkd_id}</p>
                <a href="#" class="inline-flex items-center justify-center w-full py-2.5 px-5 mt-5 text-sm font-medium text-gray-900 focus:outline-none bg-white rounded-lg border border-gray-200 hover:bg-gray-100 hover:text-primary-700 focus:z-10 focus:ring-4 focus:ring-gray-200 dark:focus:ring-gray-700 dark:bg-gray-800 dark:text-gray-400 dark:border-gray-600 dark:hover:text-white dark:hover:bg-gray-700">
                    <svg aria-hidden="true" class="mr-1 w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M17 16l4-4m0 0l-4-4m4 4H7m6 4v1a3 3 0 01-3 3H6a3 3 0 01-3-3V7a3 3 0 013-3h4a3 3 0 013 3v1"></path></svg>
                    Logout
                </a>
            </div>
            <ul class="pt-5 my-5 space-y-2 border-t border-gray-200 dark:border-gray-700">
                <li class="flex justify-between items-center pt-3 pl-2 mb-2 text-sm font-medium text-gray-500 uppercase dark:text-gray-400">
                    <h3>Main</h3>
                </li>
                <li>
                    <a href="#" class="flex items-center p-2 text-base font-normal text-gray-900 rounded-lg dark:text-white hover:bg-gray-100 dark:hover:bg-gray-700 group">
                        <img src={~p"/images/badges.svg"} class="w-6 h-6" alt="Badges" />
                        <span class="ml-3">My Badges</span>
                    </a>
                </li>
                <li>
                    <a href="#" class="flex items-center p-2 text-base font-normal text-gray-900 rounded-lg dark:text-white hover:bg-gray-100 dark:hover:bg-gray-700 group">
                        <img src={~p"/images/inbox.svg"} class="w-6 h-6" alt="Inbox" />
                        <span class="ml-3">My Inbox</span>
                    </a>
                </li>
                <li>
                    <a href="#" class="flex items-center p-2 text-base font-normal text-gray-900 rounded-lg dark:text-white hover:bg-gray-100 dark:hover:bg-gray-700 group">
                        <img src={~p"/images/data.svg"} class="w-6 h-6" alt="Data" />
                        <span class="ml-3">My Data</span>
                    </a>
                </li>
            </ul>
            <ul class="pt-5 my-5 space-y-2 border-t border-gray-200 dark:border-gray-700">
                <li class="flex justify-between items-center pt-3 pl-2 mb-2 text-sm font-medium text-gray-500 uppercase dark:text-gray-400">
                    <h3>Explore</h3>
                </li>
                <li>
                    <.link navigate={~p"/public-badges"} class={[
                        "flex items-center p-2 text-base font-normal text-gray-900 rounded-lg dark:text-white hover:bg-gray-100 dark:hover:bg-gray-700 group",
                        @live_action in [:public_badges, :public_badge] && "bg-gray-100 dark:bg-gray-700"
                        ]}>
                        <img src={~p"/images/public-badges.svg"} class="w-6 h-6" alt="Public Badges" />
                        <span class="ml-3">Public Badges</span>
                    </.link>
                </li>
            </ul>
            <ul class="pt-5 my-5 space-y-2 border-t border-gray-200 dark:border-gray-700">
                <li>
                    <a href="#" class="flex items-center p-2 text-base font-normal text-gray-900 rounded-lg dark:text-white hover:bg-gray-100 dark:hover:bg-gray-700 group">
                        <img src={~p"/images/settings.svg"} class="w-6 h-6" alt="Settings" />
                        <span class="ml-3">Settings</span>
                    </a>
                </li>
            </ul>
            <div class="absolute bottom-0 left-0 justify-center p-4 w-full bg-white dark:bg-gray-800 z-20">
                <span class="flex items-center pl-2 text-xs text-gray-500 dark:text-gray-400 group">
                    <.link navigate={~p"/"}><img src={~p"/images/logo.svg"} class="h-24 sm:h-" alt="Logo" /></.link>
                    <div class="ml-2 text-right">
                        <span>ver 1.7.0 beta 20250509.1</span>
                        <span>© 2025 <a href="https://app.checkd.io/leave?to=https%3A%2F%2Fcheckd.io" class="hover:text-gray-900 dark:hover:text-white underline">Dataswyft CheckD™</a>.</span>
                        <span>All Rights Reserved.</span>
                    </div>
                </span>
            </div>
        </div>
    </aside>
    """
  end

  def badges_layout(assigns) do
    ~H"""
    <section class="sm:ml-64 bg-white dark:bg-gray-900 antialiased">
        <div class="max-w-screen-xl px-4 py-8 mx-auto lg:px-6">
            <div class="max-w-3xl mx-auto text-center">
            <h2 class="text-3xl font-extrabold leading-tight tracking-tight text-gray-900 sm:text-4xl dark:text-white">
                {render_slot(@title)}
            </h2>
            <p class="mt-4 text-base font-normal text-gray-500 sm:text-xl dark:text-gray-400">
                {render_slot(@subtitle)}
            </p>
            </div>

            {render_slot(@content)}
        </div>
    </section>
    """
  end

  def badge_layout(assigns) do
    ~H"""
    <section class="sm:ml-64 bg-white dark:bg-gray-900">
        <div class="max-w-screen-xl px-4 py-8 mx-auto lg:px-6 sm:py-16 lg:py-24">
            <div class="text-center">
                <h2 class="text-3xl sm:text-6xl font-extrabold text-gray-900 dark:text-white">
                    {render_slot(@name)}
                </h2>
                <p class="mt-2 text-lg sm:text-2xl font-normal text-gray-500 dark:text-gray-400">
                    {render_slot(@issuer)}
                </p>

                <div class="flex flex-col items-center justify-center gap-4 mt-4 sm:mt-5 sm:gap-8 sm:flex-row">
                    <span class="inline-flex items-center text-base font-semibold leading-tight text-primary-600 hover:underline dark:text-primary-500">
                        {render_slot(@authentication_status)}
                    </span>
                </div>
            </div>

            <div class="max-w-5xl mx-auto mt-8 lg:mt-16">
                <img class="w-full h-96 object-contain rounded-lg shadow-lg shadow-primary-200 dark:shadow-primary-800 border border-primary-300 dark:border-primary-900" src={@image} alt="Badge image">
            </div>

            <div class="grid grid-cols-1 gap-8 mt-8 lg:gap-16 lg:mt-16">
            <div>
                <div>
                    <h3 class="text-center text-2xl font-extrabold text-gray-900 dark:text-white">
                        Overview
                    </h3>
                    <p class="text-center mt-2 text-lg font-normal text-gray-500 dark:text-gray-400">
                        {render_slot(@overview)}
                    </p>

                    {render_slot(@action_area)}
                </div>
            </div>
            </div>
        </div>
    </section>
    """
  end

  def empty_state(assigns) do
    ~H"""
    <section class="bg-white dark:bg-gray-900 antialiased mt-8">
        <div class="max-w-screen-xl px-4 py-8 mx-auto lg:px-6">
            <div class="max-w-md mx-auto text-center">
                <h4 class="text-lg font-extrabold leading-tight tracking-tight text-gray-700 sm:text-xl dark:text-gray-2--">
                    {render_slot(@title)}
                </h4>
                <p class="mt-4 text-xs font-normal text-gray-500 sm:text-sm dark:text-gray-400">
                    {render_slot(@subtitle)}
                </p>
                {render_slot(@action)}
            </div>
        </div>
    </section>
    """
  end
end
