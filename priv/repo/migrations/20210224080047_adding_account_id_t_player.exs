defmodule Persistence.Repo.Migrations.AddingAccountIdTPlayer do
  use Ecto.Migration

  def change do
    alter table(:players) do
      add :account_id, :integer
    end
  end
end
