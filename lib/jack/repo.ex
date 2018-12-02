defmodule Jack.Repo do
  use Ecto.Repo,
    otp_app: :jack,
    adapter: Ecto.Adapters.Postgres
end
