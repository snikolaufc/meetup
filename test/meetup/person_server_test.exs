defmodule Meetup.PersonServerTest do
  use PowerAssert

  alias Meetup.Person, as: Person

  setup do
    # Explicitly get a connection before each test
    # By default the test is wrapped in a transaction
    :ok = Ecto.Adapters.SQL.Sandbox.checkout(Meetup.Repo)
  end

  test "stores person in the database" do
    person = Meetup.PersonServer.create({"Milky", "milkyway"})

    assert %Person{name: "Milky", username: "milkyway"} == person
  end
end
