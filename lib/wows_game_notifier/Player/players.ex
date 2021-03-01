defmodule WowsGameNotifier.Player.Players do
    alias Persistence.Repo
    alias WowsGameNotifier.Player
    import Ecto.Query

    def create_player(player_map) do
        case Player.changeset(%Player{}, player_map) |> Repo.insert() do
            {:error, changeset} ->
                :player_already_exist
            ok_result -> ok_result
        end
    end
end
