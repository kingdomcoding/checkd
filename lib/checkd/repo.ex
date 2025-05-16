defmodule Checkd.Repo do
  use Ecto.Repo,
    otp_app: :checkd,
    adapter: Ecto.Adapters.Postgres
end
