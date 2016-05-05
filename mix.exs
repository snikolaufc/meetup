defmodule Meetup.Mixfile do
  use Mix.Project

  def project do
    [
      app: :meetup,
      version: "0.0.1",
      elixir: "~> 1.2",
      elixirc_paths: elixirc_paths(Mix.env),
      build_embedded: Mix.env == :prod,
      start_permanent: Mix.env == :prod,
      deps: deps,
      aliases: aliases
    ]
  end

  # Configuration for the OTP application
  #
  # Type "mix help compile.app" for more information
  def application do
    [
      applications: [:postgrex, :ecto, :logger],
      mod: {Meetup.App, []}
    ]
  end

  # Dependencies can be Hex packages:
  #
  #   {:mydep, "~> 0.3.0"}
  #
  # Or git/path repositories:
  #
  #   {:mydep, git: "https://github.com/elixir-lang/mydep.git", tag: "0.1.0"}
  #
  # Type "mix help deps" for more examples and options
  defp deps do
    [
      {:power_assert, "~> 0.0.8"},
      {:ecto, "~> 2.0.0-rc.3"},
      {:postgrex, ">= 0.0.0"},
      {:credo, "~> 0.3", only: [:dev, :test]},
    ]
  end

  defp elixirc_paths(_), do: ["app", "lib"]

  # See the documentation for `Mix` for more info on aliases.
  defp aliases do
    [
      "ecto.setup": ["ecto.create", "ecto.migrate"],
      "ecto.reset": ["ecto.drop", "ecto.setup"],
      "ecto.seed": ["run priv/repo/seeds.exs"],
    ]
  end
end
