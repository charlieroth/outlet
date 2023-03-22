defmodule Outlet.Application do
  @moduledoc false

  use Application
  require Logger

  @impl true
  def start(_type, _args) do
    children = [
      {Bandit, plug: Outlet.Router, scheme: :http, options: [port: 4000]}
    ]

    Logger.info("Outlet running on http://localhost:4000")
    opts = [strategy: :one_for_one, name: Outlet.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
