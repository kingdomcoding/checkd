defmodule Checkd.MixProject do
  use Mix.Project

  def project do
    [
      app: :checkd,
      version: "0.1.0",
      elixir: "~> 1.14",
      elixirc_paths: elixirc_paths(Mix.env()),
      start_permanent: Mix.env() == :prod,
      consolidate_protocols: Mix.env() != :dev,
      aliases: aliases(),
      deps: deps()
    ]
  end

  # Configuration for the OTP application.
  #
  # Type `mix help compile.app` for more information.
  def application do
    [
      mod: {Checkd.Application, []},
      extra_applications: [:logger, :runtime_tools]
    ]
  end

  # Specifies which paths to compile per environment.
  defp elixirc_paths(:test), do: ["lib", "test/support"]
  defp elixirc_paths(_), do: ["lib"]

  # Specifies your project dependencies.
  #
  # Type `mix help deps` for examples and options.
  defp deps do
    [
      {:ash_admin, "~> 0.13"},
      {:igniter, "~> 0.5", only: [:dev, :test]},
      {:phoenix, "~> 1.7.14"},
      {:phoenix_ecto, "~> 4.5"},
      {:ecto_sql, "~> 3.10"},
      {:postgrex, ">= 0.0.0"},
      {:phoenix_html, "~> 4.1"},
      {:phoenix_live_reload, "~> 1.2", only: :dev},
      # TODO bump on release to {:phoenix_live_view, "~> 1.0.0"},
      {:phoenix_live_view, "~> 1.0.0-rc.1", override: true},
      {:floki, ">= 0.30.0", only: :test},
      {:phoenix_live_dashboard, "~> 0.8.3"},
      {:esbuild, "~> 0.8", runtime: Mix.env() == :dev},
      {:tailwind, "~> 0.2", runtime: Mix.env() == :dev},
      {:heroicons,
       github: "tailwindlabs/heroicons",
       tag: "v2.1.1",
       sparse: "optimized",
       app: false,
       compile: false,
       depth: 1},
      {:swoosh, "~> 1.5"},
      {:finch, "~> 0.13"},
      {:telemetry_metrics, "~> 1.0"},
      {:telemetry_poller, "~> 1.0"},
      {:gettext, "~> 0.20"},
      {:jason, "~> 1.2"},
      {:dns_cluster, "~> 0.1.1"},
      {:bandit, "~> 1.5"},
      {:commanded, "~> 1.4"},
      {:eventstore, "~> 1.4"},
      {:commanded_eventstore_adapter, "~> 1.4"},
      {:ash_postgres, "~> 2.5"},
      {:timex, "~> 3.7"}
    ]
  end

  # Aliases are shortcuts or tasks specific to the current project.
  # For example, to install project dependencies and perform other setup tasks, run:
  #
  #     $ mix setup
  #
  # See the documentation for `Mix` for more info on aliases.
  defp aliases do
    [
      setup: ["deps.get", "data.setup", "assets.setup", "assets.build", "run priv/repo/seeds.exs"],
      "data.setup": [
        "ash.setup",
        "event_store.setup",
        "run priv/repo/seeds.exs"
      ],
      "data.reset": ["ecto.drop", "data.setup"],
      "event_store.setup": ["event_store.create", "event_store.init"],
      test: ["ash.setup --quiet", "event_store.setup", "test"],
      "assets.setup": ["tailwind.install --if-missing", "esbuild.install --if-missing"],
      "assets.build": ["tailwind checkd", "esbuild checkd"],
      "assets.deploy": [
        "tailwind checkd --minify",
        "esbuild checkd --minify",
        "phx.digest"
      ]
    ]
  end
end
