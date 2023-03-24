import Config

config :outlet,
  ecto_repos: [Outlet.Repo]

config :outlet,
       Outlet.Repo,
       database: "outlet.db"

config :logger,
       :console,
       metadata: [:request_id]
