defmodule Meetup.Repo.Migrations.CreatePeople do
  use Ecto.Migration

  def change do
    create table(:people) do
      add :name, :string, null: true
      add :username, :string, null: false

      timestamps
    end

    create unique_index(:people, [:username])
  end
end
