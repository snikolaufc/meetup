# Ecto.Adapters.SQL.Sandbox.mode(TestRepo, :manual)

defmodule Meetup.PersonServerTest do
  use PowerAssert
  # use ExUnit.Case, async: true

  alias Meetup.Person, as: Person

  setup do
    # Explicitly get a connection before each test
    # :ok = Ecto.Adapters.SQL.Sandbox.checkout(Meetup.Repo)
  end

  test "stores person in the database" do
    assert true == false
    # Meetup.Repo.start_link
    # person = Meetup.PersonServer.create({"Milky", "milkyway"})
    # assert %Person{name: "Milky", username: "milkyway"} == person
  end
end
