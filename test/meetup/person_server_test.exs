defmodule Meetup.PersonServerTest do
  #use PowerAssert
  use ExUnit.Case, async: false

  alias Meetup.Person
  alias Meetup.PersonServer, as: Server

  setup do
    # Explicitly get a connection before each test
    # By default the test is wrapped in a transaction
    pid = Server.start_link
    :ok = Ecto.Adapters.SQL.Sandbox.checkout(Meetup.Repo)

    on_exit fn ->
      Meetup.Repo.delete_all(Person)
      if is_pid(pid) do
        GenServer.stop(pid)
      end
    end

    :ok
  end

  test "stores person in the database" do
    assert Server.create(%{name: "Milky", username: "milkyway"}) == :ok
  end

  test "raises an error for a duplicate username" do
    Server.create(%{name: "Milky", username: "milkyway"})
    assert :error == Server.create(%{name: "Another milky", username: "milkyway"})
  end

  test "raises an error for an empty username" do
    assert :error == Server.create(%{name: "Another milky", username: ""})
  end

  test "raises an error when no username is given" do
    assert :error == Server.create(%{name: "Another milky", username: nil})
  end

  test "raises an error when it cannot retreive a person from a given username" do
    assert :error == Server.get("jammydodger")
  end

  test "returns a person when found" do
    :ok = Server.create(%{name: "Jammy", username: "jammydodger"})

    assert {:ok, %Person{name: "Jammy", username: "jammydodger"}} = Server.get("jammydodger")
  end
end
