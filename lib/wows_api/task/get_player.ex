defmodule WowsApi.WowsClient.Task.GetPlayer do
  @moduledoc """
  get player from user api
  using wow api : [doc](https://developers.wargaming.net/reference/all/wows/account/list/)
  """

  @spec get_first_player_from_name(String.t())::%{account_id: integer, nickname: String.t()}
  def get_first_player_from_name(playername) do
    WowsApi.WowsClient.get!('account/list/', [], params: %{search: playername}).body
    |> List.first()
    |> Map.new(fn {k, v} -> {String.to_atom(k), v} end)
  end
end
