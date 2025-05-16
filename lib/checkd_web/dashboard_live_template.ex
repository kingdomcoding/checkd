defmodule CheckdWeb.DashboardLiveTemplate do
  use CheckdWeb, :html

  def render(assigns) do
    ~H"""
    <.sidebar />
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
            <div class="flex justify-between pl-2 mb-5">
                <a href={~p"/"}><img src={~p"/images/logo.svg"} class="mr-3 h-6 sm:h-8" alt="Logo" /></a>
                <img src={~p"/images/scanner.svg"} class="mr-3 h-6 sm:h-8" alt="Scanner" />
            </div>
            <ul class="space-y-2">
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
        </div>
    </aside>
    """
  end
end
