ExUnit.start

# Create the database, run migrations, and start the test transaction.
Mix.Task.run "ecto.create", ["--quiet"]
Mix.Task.run "ecto.migrate", ["--quiet"]

# The :shared mode allows a process to share
# its connection with any other process automatically
Ecto.Adapters.SQL.Sandbox.mode(Meetup.Repo, {:shared, self()})

