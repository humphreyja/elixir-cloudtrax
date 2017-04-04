use Mix.Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :exfi_router, ExfiRouter.Endpoint,
  http: [port: 4001],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn

# Configure your database
config :exfi_router, ExfiRouter.Repo,
  adapter: Ecto.Adapters.Postgres,
  database: "whiteboard_exfi_router_test",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox
