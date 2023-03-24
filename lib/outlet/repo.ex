defmodule Outlet.Repo do
  use Ecto.Repo,
    otp_app: :outlet,
    adapter: Ecto.Adapters.SQLite3
end
