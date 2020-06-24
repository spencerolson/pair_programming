defmodule PairProgramming.Repo do
  use Ecto.Repo,
    otp_app: :pair_programming,
    adapter: Ecto.Adapters.Postgres
end
