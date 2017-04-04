defmodule ExfiRouter.Repo.Migrations.CreateSession do
  use Ecto.Migration

  def change do
    create table(:sessions) do
      add :data, :map
      add :user_id, references(:users, on_delete: :nothing)
      add :device_id, references(:devices, on_delete: :nothing)

      timestamps()
    end
    create index(:sessions, [:user_id])
    create index(:sessions, [:device_id])

  end
end
