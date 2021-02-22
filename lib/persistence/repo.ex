defmodule Persistence.Repo do
  use Ecto.Repo,
    otp_app: :wows_game_notifier,
    adapter: Ecto.Adapters.Postgres
end
