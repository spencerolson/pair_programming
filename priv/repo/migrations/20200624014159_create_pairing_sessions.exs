defmodule PairProgramming.Repo.Migrations.CreatePairingSessions do
  use Ecto.Migration

  def change do
    create table(:pairing_sessions) do
      add :title, :string, null: false
      add :description, :text, null: false
      add :user_id, references(:users), null: false
      add :partner_id, references(:users)
      add :date, :date, null: false
      add :tags, :string, default: "", null: false

      timestamps()
    end
  end
end
