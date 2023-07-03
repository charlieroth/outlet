defmodule Outlet.Posts do
  alias Outlet.Repo
  alias Outlet.Accounts.User
  alias Outlet.Posts.Post

  def create!(author_id, title, body) do
    Repo.get!(User, author_id)
    |> Ecto.build_assoc(:posts, %{title: title, body: body})
    |> Repo.insert!()
  end

  def author_posts(author_id) do
    Repo.all(Post, user_id: author_id)
  end

  def all() do
    Repo.all(Post)
  end
end
