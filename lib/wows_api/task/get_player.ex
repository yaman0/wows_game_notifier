defmodule WowsApi.WowsClient.Task.GetPlayer do
  def get_first_player_from_name(playername) do
    WowsApi.WowsClient.get!('account/list/', [], params: %{search: playername}).body
    |> List.first()
  end
end
