use Mix.Config
config :meetup, Meetup.Repo,
  adapter: Ecto.Adapters.Postgres,
  database: "meetup",
  username: "postgres",
  password: "postgres",
  hostname: "localhost",
  url: "postgres://postgres:postgres@localhost/meetup"
