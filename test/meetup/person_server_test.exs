defmodule Meetup.PersonServerTest do
  use PowerAssert

  alias Meetup.Person
  alias Meetup.PersonServer, as: Server

  setup do
    # Explicitly get a connection before each test
    # By default the test is wrapped in a transaction
    :ok = Ecto.Adapters.SQL.Sandbox.checkout(Meetup.Repo)
  end

  test "stores person in the database" do
    person = Server.create({"Milky", "milkyway"})

    assert %Person{name: "Milky", username: "milkyway"} = person
  end

  test "raises an error for a duplicate username" do
    Server.create({"Milky", "milkyway"})

    assert_raise Ecto.ConstraintError, fn ->
      Server.create({"Another milky", "milkyway"})
    end
  end

  test "raises an error for an empty username" do
    assert_raise Ecto.InvalidChangesetError, fn ->
      Server.create({"Another milky", ""})
    end
  end

  test "raises an error when no username is given" do
    assert_raise Postgrex.Error, fn ->
      Server.create({"Another milky", nil})
    end
  end

  test "returns nil when the person does not exist" do
    assert nil == Server.get("jammydodger")
  end

  test "returns a person when found" do
    Server.create({"Jammy", "jammydodger"})

    assert %Person{name: "Jammy", username: "jammydodger"} = Server.get("jammydodger")
  end
end
