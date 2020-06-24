defmodule PairProgramming.Repo.Migrations.CreatePairingSessions do
  use Ecto.Migration

  def change do
    create table(:pairing_sessions) do
      add :title, :string
      add :description, :text
      add :creator, :string
      add :partner, :string
      add :date, :date
      add :label, :string

      timestamps()
    end

  end
end
