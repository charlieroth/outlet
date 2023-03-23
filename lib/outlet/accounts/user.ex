defmodule Outlet.Accounts.User do
  @derive Jason.Encoder
  defstruct [:id, :name, :age]
end
