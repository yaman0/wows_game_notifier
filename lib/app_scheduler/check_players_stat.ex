defmodule AppScheduler.CheckPlayersStat do
  @moduledoc """
  scheduled task to check player stat and display new game
  """
  alias Persistence.Repo
  alias WowsGameNotifier.Player
  alias WowsApi.WowsClient.Task.GetStats
  alias WowsGameNotifier.Player.Task.CompareStat
  alias WowsGameNotifier.Player.Players

  @doc """
  executing task by scheduler
  """
  def execute() do
    {:ok, [guild | _]} = Alchemy.Client.get_current_guilds()
    {:ok, channels} = Alchemy.Client.get_channels(guild.id)

    channel =
      channels
      |> Enum.filter(&String.match?(&1.name, ~r/.*bot.*/))
      |> hd
      |> get_channel_id

    Alchemy.Client.send_message("ok", channel)

    Player
    |> Repo.all()
    |> Enum.each(fn player ->
      case process(player) do
        {:changes, diff} ->
          Alchemy.Client.send_message(channel, render_message(player, diff))
        other -> other
      end
    end)
  end

  @spec process(Player) :: {atom, Stat}
  def process(player) do
    stat = GetStats.get_player_stat(player.account_id)
    case CompareStat.with_stat(player, stat) do
      {:changes, diff} ->
        Players.update_player_stat(player, stat)
        {:changes, diff}

      other -> other
    end
  end

  defp render_message(player, diff) do
    game_status_message = if diff.wins ==  0 do
        "loose"
      else
        "win"
      end

    "#{player.playername} : #{game_status_message} (+#{diff.xp}xp) => {kill: #{diff.frags}, damage: #{
      diff.damage_dealt
    }}"
  end

  defp get_channel_id(channel) do
    channel.id
  end
end
