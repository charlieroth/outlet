defmodule Outlet.Accounts do
  def list_users() do
    GenServer.call(Repo, {:list, :users})
  end

  def get_user(id) do
    GenServer.call(Repo, {:get, :users, id})
  end

  def create_user(%{"name" => _name, "age" => _age} = user) do
    GenServer.call(Repo, {:create, :users, user})
  end

  def remove_user(id) do
    GenServer.cast(Repo, {:remove, :users, id})
  end
end
