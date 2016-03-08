defmodule Meetup.Person do
  use Ecto.Schema

  import Ecto.Changeset

  schema "people" do
    field :name
    field :username
    timestamps
  end
end
