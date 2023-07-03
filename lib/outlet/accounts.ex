defmodule Outlet.Accounts do
  import Ecto.Query
  alias Outlet.Repo
  alias Outlet.Accounts.User
  alias Outlet.Accounts.Followers

  def follow_author(user_id, user_id_to_follow) do
    if already_follows?(user_id, user_id_to_follow) do
      {:error, :already_following}
    else
      %Followers{}
      |> Followers.changeset(%{follower: user_id, followed: user_id_to_follow})
      |> Repo.insert()
    end
  end

  def already_follows?(user_id, user_id_to_follow) do
    case Repo.all(Followers, follower: user_id) do
      [] ->
        false

      users_following ->
        Enum.any?(users_following, fn user_following ->
          user_following.followed == user_id_to_follow
        end)
    end
  end

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
