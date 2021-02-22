defmodule WowsGameNotifier.Persistence.Repo.Migrations.CreatePlayer do
  use Ecto.Migration

  def change do
    create table(:players) do
      add :playername, :string
    end
    create unique_index(:players, [:playername])
  end
end
