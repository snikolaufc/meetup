defmodule Meetup.PersonServer do
  alias Meetup.Person
  alias Meetup.Repo

  use GenServer

  @name PS

  def start_link(options \\ []) do
    GenServer.start_link(__MODULE__, :ok, options ++ [name: PS])
  end

  def stop do
    GenServer.stop(PS)
  end

  def create(person_options) do
    GenServer.call(@name, {:create, person_options})
  end

  def get(username) do
    GenServer.call(@name, {:get, username})
  end

  def handle_call({:create, options}, _from, _state) do
     changeset = Person.changeset(%Person{}, options)
     result = Repo.insert(changeset)

     case result do
       {:ok, _} -> {:reply, :ok, []}
       {:error, _} -> {:reply, :error, []}
     end
  end

  def handle_call({:get, username}, _from, _state) do
    person = Person |> Repo.get_by(username: username)
    case person do
      nil -> {:reply, :error, []}
      _ -> {:reply, {:ok, person}, []}
    end
  end
end
