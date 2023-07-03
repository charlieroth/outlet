defmodule Outlet.Accounts do
  alias Outlet.Repo
  alias Outlet.Accounts.User

  def list_users() do
    Repo.all(User, [])
  end

  def get_user(id) do
    Repo.get!(User, id)
  end

  def create_user(%{name: _name, age: _age} = user) do
    user_with_id = Map.put(user, :id, UUID.uuid4())

    %User{}
    |> User.changeset(user_with_id)
    |> Repo.insert!()
  end

  def remove_user(id) do
    user = Repo.get!(User, id)
    Repo.delete!(user)
  end
end
