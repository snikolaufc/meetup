defmodule Meetup.App do
  use Application

  def start(_type, _args) do
    import Supervisor.Spec
    tree = [supervisor(Meetup.Repo, [])]
    opts = [name: Meetup.Sup, strategy: :one_for_one]
    Supervisor.start_link(tree, opts)
  end
end
