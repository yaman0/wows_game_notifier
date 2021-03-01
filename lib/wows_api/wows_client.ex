defmodule WowsApi.WowsClient do
  @moduledoc """
  Api client base for world of warship api
  [api doc](https://developers.wargaming.net/reference/all/wows/)
  """

  use HTTPoison.Base

  @doc """
  get request url hook
  """
  def process_request_url(url) do
    "https://api.worldofwarships.eu/wows/" <> url
  end

  @doc """
  response body parsing hook
  """
  def process_response_body(body) do
    body
    |> Poison.decode!
    |> Map.get("data")
  end

  @doc """
  adding request params hook
  """
  def process_request_params(params) do
    params
    |> Map.merge(%{application_id: Application.fetch_env!(:wows_game_notifier, :app_id)})
  end
end
