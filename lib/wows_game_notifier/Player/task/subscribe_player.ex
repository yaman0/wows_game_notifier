defmodule WowsGameNotifier.Player.Task.SubscribePlayer do
  alias WowsGameNotifier.Player.Players

  def subscribe(playername) do
    wow_player = WowsApi.WowsClient.Task.GetPlayer.get_first_player_from_name(playername)
    Players.create_player(wow_player[:nickname], wow_player[:account_id])
  end
end
