defmodule WowsGameNotifier.Player.Players do
    alias Persistence.Repo
    alias WowsGameNotifier.Player
    import Ecto.Query

    def create_player(playername, account_id) do
        player = %{playername: playername, account_id: Integer.to_string(account_id)}
        case Player.changeset(%Player{}, player) |> Repo.insert() do
            {:error, changeset} ->
                :player_already_exist
                IO.inspect(changeset)
            ok_result -> ok_result
        end
    end

end
