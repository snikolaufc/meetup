defmodule Meetup.PersonServer do
  alias Meetup.Person
  alias Meetup.Repo

  def create({name, username}) do
    person = %Person{name: name, username: username}

    Repo.insert!(person)
  end

  def get(username) do
    Repo.get_by(Person, username: username)
  end
end
