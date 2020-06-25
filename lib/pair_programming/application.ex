defmodule PairProgramming.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      PairProgramming.Repo,
      # Start the Telemetry supervisor
      PairProgrammingWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: PairProgramming.PubSub},
      # Start the Endpoint (http/https)
      PairProgrammingWeb.Endpoint,
      # Start a worker by calling: PairProgramming.Worker.start_link(arg)
      # {PairProgramming.Worker, arg}
      Pow.Store.Backend.MnesiaCache
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: PairProgramming.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  def config_change(changed, _new, removed) do
    PairProgrammingWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
