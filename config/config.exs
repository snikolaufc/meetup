use Mix.Config

config :meetup,
  ecto_repos: [Meetup.Repo]

import_config "#{Mix.env}.exs"
