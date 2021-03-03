defmodule AppScheduler do
  @moduledoc """
  application scheduler
  managing task scheduled using quantum lib [doc](https://hexdocs.pm/quantum/configuration.html)
  """
  use Quantum, otp_app: :wows_game_notifier
end
