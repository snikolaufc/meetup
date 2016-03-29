defmodule Meetup.PersonServer do
  alias Meetup.Person
  alias Meetup.Repo

  def create({name, username}) do
    changeset = Person.changeset(%Person{}, %{name: name, username: username})
    Repo.insert!(changeset)
  end

  def get(username) do
    Repo.get_by(Person, username: username)
  end
end
