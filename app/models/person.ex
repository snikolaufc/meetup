defmodule Meetup.Person do
  use Ecto.Schema

  import Ecto.Changeset

  schema "people" do
    field :name
    field :username
    timestamps
  end

  def changeset(person, params \\ :invalid) do
    person |> cast(params, [:name, :username])
            |> validate_required(:username)
            |> validate_length(:username, min: 1)
            |> unique_constraint(:username)
  end
end
