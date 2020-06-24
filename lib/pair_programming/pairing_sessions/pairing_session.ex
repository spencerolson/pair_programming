defmodule PairProgramming.PairingSessions.PairingSession do
  use Ecto.Schema
  import Ecto.Changeset

  schema "pairing_sessions" do
    field :creator, :string
    field :date, :date
    field :description, :string
    field :label, :string
    field :partner, :string
    field :title, :string

    timestamps()
  end

  @doc false
  def changeset(pairing_session, attrs) do
    pairing_session
    |> cast(attrs, [:title, :description, :creator, :partner, :date, :label])
    |> validate_required([:title, :description, :creator, :partner, :date, :label])
  end
end
