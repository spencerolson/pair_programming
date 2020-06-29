defmodule PairProgramming.PairingSessions do
  @moduledoc """
  The PairingSessions context.
  """

  import Ecto.Query, warn: false
  alias PairProgramming.Repo

  alias PairProgramming.PairingSessions.PairingSession

  @doc """
  Returns the list of pairing_sessions.

  ## Examples

      iex> list_pairing_sessions()
      [%PairingSession{}, ...]

  """
  def list_pairing_sessions do
    Repo.all(from p in PairingSession, preload: [:user, :partner])
  end

  @doc """
  Gets a single pairing_session.

  Raises `Ecto.NoResultsError` if the Pairing session does not exist.

  ## Examples

      iex> get_pairing_session!(123)
      %PairingSession{}

      iex> get_pairing_session!(456)
      ** (Ecto.NoResultsError)

  """
  def get_pairing_session!(id), do: Repo.get!(PairingSession, id)

  @doc """
  Creates a pairing_session.

  ## Examples

      iex> create_pairing_session(%{field: value})
      {:ok, %PairingSession{}}

      iex> create_pairing_session(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_pairing_session(attrs \\ %{}) do
    {:ok, pairing_session} =
      %PairingSession{}
      |> PairingSession.changeset(attrs)
      |> Repo.insert()

    pairing_session = Repo.preload(pairing_session, [:user, :partner])
    broadcast(pairing_session, :pairing_session_created)
    {:ok, pairing_session}
  end

  @doc """
  Updates a pairing_session.

  ## Examples

      iex> update_pairing_session(pairing_session, %{field: new_value})
      {:ok, %PairingSession{}}

      iex> update_pairing_session(pairing_session, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_pairing_session(%PairingSession{} = pairing_session, attrs) do
    pairing_session
    |> PairingSession.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a pairing_session.

  ## Examples

      iex> delete_pairing_session(pairing_session)
      {:ok, %PairingSession{}}

      iex> delete_pairing_session(pairing_session)
      {:error, %Ecto.Changeset{}}

  """
  def delete_pairing_session(%PairingSession{} = pairing_session) do
    Repo.delete(pairing_session)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking pairing_session changes.

  ## Examples

      iex> change_pairing_session(pairing_session)
      %Ecto.Changeset{data: %PairingSession{}}

  """
  def change_pairing_session(%PairingSession{} = pairing_session, attrs \\ %{}) do
    PairingSession.changeset(pairing_session, attrs)
  end

  def subscribe do
    Phoenix.PubSub.subscribe(PairProgramming.PubSub, "pairing_sessions")
  end

  defp broadcast({:error, _reason} = error, _event), do: error

  defp broadcast(pairing_session, event) do
    Phoenix.PubSub.broadcast(PairProgramming.PubSub, "pairing_sessions", {event, pairing_session})
  end
end
