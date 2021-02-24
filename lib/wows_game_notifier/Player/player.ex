defmodule WowsGameNotifier.Player do
  use Ecto.Schema
  import Ecto.Changeset

  schema "players" do
    field :playername, :string
    field :account_id, :string
  end

  def changeset(player, params \\ %{}) do
    player
    |> cast(params, [:playername, :account_id])
    |> validate_required([:playername])
    |> unique_constraint(:playername)
  end
end
