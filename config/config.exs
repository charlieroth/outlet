import Config

config :outlet, bandit_port: 4000

config :logger, :console, metadata: [:request_id]
