defmodule PairProgramming.Repo.Migrations.CreatePairingSessions do
  use Ecto.Migration

  def change do
    create table(:pairing_sessions) do
      add :title, :string
      add :description, :text
      add :user_id, references(:users)
      add :partner_id, references(:users)
      add :date, :date
      add :label, :string

      timestamps()
    end

  end
end
