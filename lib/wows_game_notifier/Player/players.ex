defmodule WowsGameNotifier.Player.Players do
    @moduledoc """
    persistence utils function for schemas Players
    """
    alias Persistence.Repo
    alias WowsGameNotifier.Player
    alias WowsGameNotifier.Stat
    require Logger

    @doc """
    persist user from params in parameters
    """
    @spec create_player(map()):: {atom, Player}
    def create_player(player_map) do
        case Player.changeset(%Player{}, player_map) |> Repo.insert() do
            {:error, changeset} ->
                Logger.info(changeset)
                :player_already_exist
            ok_result -> ok_result
        end
    end

    @spec update_player_stat(Player, Stat):: {atom, Player}
    def update_player_stat(player, stat) do
        Player.changeset(player, Map.from_struct(stat)) |> Repo.update()
    end
end

"""
p = Player |> Persistence.Repo.all |> hd
s = %WowsGameNotifier.Stat{
    damage_dealt: 14194244,
    frags: 348,
    wins: 294,
    xp: 795264
  }
"""
