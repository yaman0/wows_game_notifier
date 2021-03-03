defmodule AppScheduler.CheckPlayersStat do
  @moduledoc """
  scheduled task to check player stat and display new game
  """

  @doc """
  executing task by scheduler
  """
  def execute() do
    {:ok, [guild | _]} = Alchemy.Client.get_current_guilds()
    {:ok, channels} = Alchemy.Client.get_channels(guild.id)
    channels
    |> Enum.filter(&(String.match?(&1.name, ~r/.*bot.*/)))
    |> hd
    |> get_channel_id
    |> Alchemy.Client.send_message("Hello !")
  end

  @doc """
  get id from channel
  """
  defp get_channel_id(channel) do
    channel.id
  end
end
