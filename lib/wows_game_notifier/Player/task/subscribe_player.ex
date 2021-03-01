defmodule WowsGameNotifier.Player.Task.SubscribePlayer do
  alias WowsGameNotifier.Player.Players
  alias WowsApi.WowsClient.Task.{GetStats, GetPlayer}

  def subscribe(playername) do
    wow_player = GetPlayer.get_first_player_from_name(playername)

    Map.merge(wow_player, GetStats.get_player_stat(wow_player["account_id"]))
    |> Map.merge(%{"playername" => wow_player["nickname"]})
    |> Players.create_player
  end
end
