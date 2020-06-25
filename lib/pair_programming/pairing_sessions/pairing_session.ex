defmodule PairProgramming.PairingSessions.PairingSession do
  use Ecto.Schema
  import Ecto.Changeset

  schema "pairing_sessions" do
    field :date, :date
    field :description, :string
    field :label, :string
    field :title, :string

    belongs_to :user, PairProgramming.Users.User
    belongs_to :partner, PairProgramming.Users.User

    timestamps()
  end

  @doc false
  def changeset(pairing_session, attrs) do
    pairing_session
    |> cast(attrs, [:title, :description, :user_id, :partner_id, :date, :label])
    |> validate_required([:title, :description, :user_id, :date, :label])
  end
end
