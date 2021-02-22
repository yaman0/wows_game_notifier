defmodule DiscordBot do
  use Application
  alias Alchemy.Client

  defmodule Commands do
    use Alchemy.Cogs

    Cogs.def ping do
      Cogs.say "pong!"
    end

    Cogs.def sub(username) do
      case WowsGameNotifier.Player.Players.create_player(username) do
        :player_already_exist -> Cogs.say "player already subscribed"
        _ -> Cogs.say "subscribing to player : " <> username
      end
    end
  end

  def start(_type, _args) do
    children = [
      Persistence.Repo,
    ]
    opts = [strategy: :one_for_one, name: MyBot]
    Supervisor.start_link(children, opts)

    run = Client.start(Application.fetch_env!(:wows_game_notifier, :discord_token))
    use Commands
    run
  end
end
