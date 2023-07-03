defmodule Outlet.Posts do
  alias Outlet.Posts.Post
  alias Outlet.Repo

  def create!(title, body) do
    %Post{}
    |> Post.changeset(%{title: title, body: body})
    |> Repo.insert!()
  end
end
