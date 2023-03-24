defmodule Outlet.Application do
  @moduledoc false

  use Application
  require Logger

  @impl true
  def start(_type, _args) do
    port = bandit_port()

    children = [
      {Bandit, plug: Outlet.Router, scheme: :http, options: [port: port]},
      Outlet.Repo
    ]

    Logger.info("Starting application...")
    opts = [strategy: :one_for_one, name: Outlet.Supervisor]
    Supervisor.start_link(children, opts)
  end

  defp bandit_port, do: 4000
end
