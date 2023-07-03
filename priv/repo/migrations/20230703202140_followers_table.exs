defmodule Outlet.Repo.Migrations.FollowersTable do
  use Ecto.Migration

  def change do
    create table(:followers, primary_key: false) do
      add :id, :uuid, primary_key: true
      add :followed, :binary_id
      add :follower, :binary_id
    end
  end
end
