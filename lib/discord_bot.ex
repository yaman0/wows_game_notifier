defmodule DiscordBot do
  use Application
  alias Alchemy.Client
  alias WowsGameNotifier.Player.Task.SubscribePlayer


  defmodule Commands do
    use Alchemy.Cogs

    @wows_profile_uri "https://worldofwarships.eu/en/community/accounts/"

    Cogs.def ping do
      Cogs.say "pong!"
    end

    Cogs.def sub(username) do
      case SubscribePlayer.subscribe(username) do
        :player_already_exist -> Cogs.say "player already subscribed"
        {:ok, player} ->
           Cogs.say "subscribing to player : " <> player.playername <> "(" <> generate_uri(player) <> ")"
      end
    end

    defp generate_uri(player) do
      @wows_profile_uri <> Integer.to_string(player.account_id) <> "-" <> player.playername <> "/"
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
