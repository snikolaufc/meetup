use Mix.Config

config :meetup, Meetup.Repo,
  adapter: Ecto.Adapters.Postgres,
  database: "meetup_test",
  username: "postgres",
  password: "postgres",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox
