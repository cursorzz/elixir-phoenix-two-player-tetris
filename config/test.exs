use Mix.Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :josh_tetris, JoshTetris.Endpoint,
  http: [port: 4001],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn

# Configure your database
config :josh_tetris, JoshTetris.Repo,
  adapter: Ecto.Adapters.Postgres,
  username: "jorgecruz",
  database: "josh_tetris_test",
  pool: Ecto.Adapters.SQL.Sandbox
