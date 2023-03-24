defmodule Outlet.MixProject do
  use Mix.Project

  def project do
    [
      app: :outlet,
      version: "0.1.0",
      elixir: "~> 1.14",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  def application do
    [
      extra_applications: [:logger],
      mod: {Outlet.Application, []}
    ]
  end

  defp deps do
    [
      {:plug, "~> 1.14"},
      {:bandit, "~> 0.7.3"},
      {:jason, "~> 1.4"},
      {:ecto_sqlite3, "~> 0.9.1"},
      {:litestream, "~> 0.3.0"},
      {:uuid, "~> 1.1"}
    ]
  end
end
