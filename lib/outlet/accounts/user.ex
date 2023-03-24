defmodule Outlet.Accounts.User do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}

  schema "users" do
    field(:name, :string)
    field(:age, :integer)
  end

  def changeset(user, attrs \\ %{}) do
    user
    |> cast(attrs, [:name, :age])
    |> validate_required([:name, :age])
  end
end
