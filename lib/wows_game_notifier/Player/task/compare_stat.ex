defmodule WowsGameNotifier.Player.Task.CompareStat do
  @moduledoc """
  task to subscribe playe (pull user account_id, get stat and persist to database)
  """

  alias WowsGameNotifier.Player
  alias WowsGameNotifier.Stat
  alias WowsApi.WowsClient.Task.GetStats

  @doc """
    compare player stat with other stat
  """
  @spec with_stat(Player, Stat):: {atom, Stat}
  def with_stat(player, stat) do
    diff = %Stat{
      frags: stat.frags - player.frags,
      wins: stat.wins - player.wins,
      xp: stat.xp - player.xp,
      damage_dealt: stat.damage_dealt - player.damage_dealt,
    }

    no_change_stat = %Stat{
      frags: 0,
      wins: 0,
      xp: 0,
      damage_dealt: 0,
    }

    if diff == no_change_stat do
      {:no_change}
    else
      {:changes, diff}
    end
  end
end
