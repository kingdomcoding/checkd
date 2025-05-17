defmodule Checkd.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  use Commanded.Application,
    otp_app: :checkd,
    event_store: [
      adapter: Commanded.EventStore.Adapters.EventStore,
      event_store: Checkd.EventStore
    ]

  @impl true
  def start(_type, _args) do
    children = [
      CheckdWeb.Telemetry,
      Checkd.Repo,
      {DNSCluster, query: Application.get_env(:checkd, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: Checkd.PubSub},
      # Start the Finch HTTP client for sending emails
      {Finch, name: Checkd.Finch},
      # Start a worker by calling: Checkd.Worker.start_link(arg)
      # {Checkd.Worker, arg},
      # Start to serve requests, typically the last entry
      CheckdWeb.Endpoint,
      __MODULE__,
      CheckdWeb.BadgeUser.ReadModels.Domain
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Checkd.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    CheckdWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
