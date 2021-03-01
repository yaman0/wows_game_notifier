defmodule WowsGameNotifier.Player.Task.SubscribePlayer do
  @moduledoc """
  task to subscribe playe (pull user account_id, get stat and persist to database)
  """

  alias WowsGameNotifier.Player.Players
  alias WowsApi.WowsClient.Task.{GetStats, GetPlayer}

  @doc """
  subscribe player to database from his playername
  """
  @spec subscribe(String.t()):: {atom, Players}
  def subscribe(playername) do
    wow_player = GetPlayer.get_first_player_from_name(playername)

    GetStats.get_player_stat(wow_player[:account_id])
    |> Map.from_struct()
    |> Map.merge(wow_player)
    |> Map.merge(%{playername: wow_player[:nickname]})
    |> Players.create_player
  end
end
