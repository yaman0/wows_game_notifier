defmodule Persistence.Repo do
  @moduledoc """
  persistence repo module form app
  """

  use Ecto.Repo,
    otp_app: :wows_game_notifier,
    adapter: Ecto.Adapters.Postgres
end
