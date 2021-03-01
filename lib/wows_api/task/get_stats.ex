defmodule WowsApi.WowsClient.Task.GetStats do
  @extra "statistics.rank_solo"
  def get_player_stat(account_id) do
    WowsApi.WowsClient.get!('account/info/', [], params: %{account_id: account_id, extra: @extra}).body[Integer.to_string(account_id)]["statistics"]["pvp"]
      |> Map.take(["frags", "looses", "wins", "xp", "damage_dealt"])
  end
end
