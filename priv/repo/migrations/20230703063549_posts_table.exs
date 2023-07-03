defmodule Outlet.Repo.Migrations.PostsTable do
  use Ecto.Migration

  def change do
    create table(:posts, primary_key: false) do
      add :id, :uuid, primary_key: true
      add :title, :string
      add :body, :string
    end
  end
end
