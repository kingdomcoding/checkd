defmodule CheckdWeb.DashboardLiveTemplate do
  use CheckdWeb, :html

  def render(assigns) do
    ~H"""
    <.sidebar live_action={@live_action} checkd_id={@checkd_id} />
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
                    <a href="#" class="flex items-center p-2 text-base font-normal text-gray-900 rounded-lg dark:text-white hover:bg-gray-100 dark:hover:bg-gray-700 group">
                        <img src={~p"/images/public-badges.svg"} class="w-6 h-6" alt="Public Badges" />
                        <span class="ml-3">Public Badges</span>
                    </a>
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
                    <a href={~p"/"}><img src={~p"/images/logo.svg"} class="h-24 sm:h-" alt="Logo" /></a>
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
end
