use Mix.Config

config :meetup, Meetup.Repo,
  adapter: Ecto.Adapters.Postgres,
  database: "meetup_dev",
  username: "postgres",
  password: "postgres",
  hostname: "localhost"
