defmodule WowsApi.WowsClient.Task.GetStats do
  @moduledoc """
  task to get stat from player
  using wow api player info [doc](https://developers.wargaming.net/reference/all/wows/account/info/)
  """

  alias WowsGameNotifier.Stat

  @extra ""

  @doc """
  pulling player stat from using wows account_id
  """
  @spec get_player_stat(integer):: Stat
  def get_player_stat(account_id) do
    WowsApi.WowsClient.get!('account/info/', [], params: %{account_id: account_id, extra: @extra}).body[Integer.to_string(account_id)]["statistics"]["pvp"]
    |> cast_to_stat()
  end

  defp cast_to_stat(map) do
    %Stat{
      frags: map["frags"],
      wins: map["wins"],
      xp: map["xp"],
      damage_dealt: map["damage_dealt"],
    }
  end
end
