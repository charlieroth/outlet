defmodule Outlet.Accounts.User do
  use Ecto.Schema
  import Ecto.Changeset
  alias Outlet.Posts.Post

  @primary_key {:id, :binary_id, autogenerate: true}

  schema "users" do
    field(:name, :string)
    field(:age, :integer)
    has_many(:posts, Post)
  end

  def changeset(user, attrs \\ %{}) do
    user
    |> cast(attrs, [:name, :age])
    |> validate_required([:name, :age])
  end

  def to_json(user) do
    %{
      id: user.id,
      name: user.name,
      age: user.age
    }
    |> Jason.encode!()
  end
end
