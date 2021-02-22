defmodule WowsGameNotifier.Player.Players do
    alias Persistence.Repo
    alias WowsGameNotifier.Player
    import Ecto.Query

    def create_player(playername) do
        case Player.changeset(%Player{}, %{playername: playername}) |> Repo.insert() do
            {:error, changeset} -> :player_already_exist
            _ -> :ok
        end
    end

end
