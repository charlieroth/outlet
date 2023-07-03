defmodule Outlet.Posts.Post do
  use Ecto.Schema
  import Ecto.Changeset
  alias Outlet.Accounts.User

  @primary_key {:id, :binary_id, autogenerate: true}

  schema "posts" do
    field(:title, :string)
    field(:body, :string)
    belongs_to(:user, User, type: :binary_id)
  end

  def changeset(post, attrs \\ %{}) do
    post
    |> cast(attrs, [:title, :body])
    |> validate_required([:title, :body])
  end

  def to_json(post) do
    %{
      id: post.id,
      title: post.title,
      body: post.body
    }
    |> Jason.encode!()
  end
end
