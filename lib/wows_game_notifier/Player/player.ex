defmodule WowsGameNotifier.Player do
  @moduledoc """
  player entity from players schemas
  """

  use Ecto.Schema
  import Ecto.Changeset

  schema "players" do
    field :playername, :string
    field :account_id, :integer
    field :damage_dealt, :integer
    field :wins, :integer
    field :frags, :integer
    field :xp, :integer
  end

  @doc """
  parse and validate player before persist
  """
  def changeset(player, params \\ %{}) do
    player
    |> cast(params, [:playername, :account_id, :damage_dealt, :wins, :frags, :xp])
    |> validate_required([:playername])
    |> unique_constraint(:playername)
  end
end
