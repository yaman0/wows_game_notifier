defmodule Persistence.Repo.Migrations.AddingBasicStatPlayer do
  use Ecto.Migration

  def change do
    alter table(:players) do
      add :damage_dealt, :integer, default: 0
      add :wins, :integer, default: 0
      add :frags, :integer, default: 0
      add :xp, :integer, default: 0
    end
  end
end
