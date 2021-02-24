defmodule WowsApi.WowsClient do
  use HTTPoison.Base

  def process_request_url(url) do
    "https://api.worldofwarships.eu/wows/" <> url
  end

  def process_response_body(body) do
    response = body
    |> Poison.decode!
    |> Map.get("data")
#    |> Enum.map(fn({k, v}) -> {String.to_atom(k), v} end)
  end

  def process_request_params(params) do
    params
    |> Map.merge(%{application_id: Application.fetch_env!(:wows_game_notifier, :app_id)})
  end
end

# WowsApi.WowsClient.get!("encyclopedia/info/").body[:game_version]
