# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :pair_programming,
  ecto_repos: [PairProgramming.Repo]

# Configures the endpoint
config :pair_programming, PairProgrammingWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "q5S0ZDIw36vb1PkaGAgXfG9fNwGWo8bllmzjfDsnduZpdLLZTHUfq0Z7AViuZSVV",
  render_errors: [view: PairProgrammingWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: PairProgramming.PubSub,
  live_view: [signing_salt: "OEBm4bbx"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
