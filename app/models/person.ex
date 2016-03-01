defmodule Meetup.Person do
  use Ecto.Schema

  import Ecto.Changeset

  schema "person" do
    field :name
    field :username
  end 
end
