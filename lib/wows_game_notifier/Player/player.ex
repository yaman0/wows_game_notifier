defmodule WowsGameNotifier.Player do
  use Ecto.Schema
  import Ecto.Changeset

  schema "players" do
    field :playername, :string
  end

  def changeset(player, params \\ %{}) do
    player
    |> cast(params, [:playername])
    |> validate_required([:playername])
    |> unique_constraint(:playername)
  end
end
