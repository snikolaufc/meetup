defmodule Meetup.PersonServer do
  alias Meetup.Person, as: Person

  def create({name, username}) do
    person = %Person{name: name, username: username}

    # case MyRepo.insert %Post{title: "Ecto is great"} do
    #  {:ok, struct}       -> # Inserted with success
    #  {:error, changeset} -> # Something went wrong
    # end

    Meetup.Repo.insert!(person)


  end

  def get(id) do

  end

end
