# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :exfi_router,
  ecto_repos: [ExfiRouter.Repo]

# Configures the endpoint
config :exfi_router, ExfiRouter.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "GIy3W1BsflDU3KcAxBrGHKlt45iV201z373oSfeMN9otOKNCuKUl8WqpGPHsk651",
  render_errors: [view: ExfiRouter.ErrorView, accepts: ~w(html json)],
  pubsub: [name: ExfiRouter.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
