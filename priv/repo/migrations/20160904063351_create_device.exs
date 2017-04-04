defmodule ExfiRouter.Repo.Migrations.CreateDevice do
  use Ecto.Migration

  def change do
    create table(:devices) do
      add :data, :map
      add :mac_address, :string
      add :user_id, references(:users, on_delete: :nothing)

      timestamps()
    end
    create index(:devices, [:user_id])

  end
end
