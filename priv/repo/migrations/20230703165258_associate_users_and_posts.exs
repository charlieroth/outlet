defmodule Outlet.Repo.Migrations.AssociateUsersAndPosts do
  use Ecto.Migration

  def change do
    alter table(:posts) do
      add :user_id, references(:users, type: :uuid)
    end
  end
end
