import Config

config :wows_game_notifier, Persistence.Repo,
  database: "wows-game-notifier",
  username: "user",
  password: "passwd",
  hostname: "localhost"

config :wows_game_notifier, ecto_repos: [Persistence.Repo]


config :wows_game_notifier,
  discord_token: "<YOUR TOKEN>"
  app_id: "<YOUR WOWS APPLICATION ID>"


  config :wows_game_notifier, AppScheduler,
  jobs: [
    # Every minute
    {"* * * * *",      {AppScheduler.CheckPlayersStat, :execute, []}}
  ]
