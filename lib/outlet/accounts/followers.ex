defmodule Outlet.Accounts.Followers do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}

  schema "followers" do
    field(:follower, :binary_id)
    field(:followed, :binary_id)
  end

  def changeset(user, attrs \\ %{}) do
    user
    |> cast(attrs, [:follower, :followed])
    |> validate_required([:follower, :followed])
  end
end
