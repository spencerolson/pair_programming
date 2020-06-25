defmodule PairProgramming.Users.User do
  use Ecto.Schema
  use Pow.Ecto.Schema

  schema "users" do
    pow_user_fields()

    has_many :pairing_sessions, PairProgramming.PairingSessions.PairingSession

    timestamps()
  end

  def avatar_path(nil) do
    "/images/anonymous-avatar.png"
  end

  def avatar_path(user) do
    "/images/#{user.email}-avatar.png"
  end
end
