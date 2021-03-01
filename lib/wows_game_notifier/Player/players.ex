defmodule WowsGameNotifier.Player.Players do
    @moduledoc """
    persistence utils function for schemas Players
    """
    alias Persistence.Repo
    alias WowsGameNotifier.Player
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
end
