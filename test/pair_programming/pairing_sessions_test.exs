defmodule PairProgramming.PairingSessionsTest do
  use PairProgramming.DataCase

  alias PairProgramming.PairingSessions

  describe "pairing_sessions" do
    alias PairProgramming.PairingSessions.PairingSession

    @valid_attrs %{creator: "some creator", date: ~D[2010-04-17], description: "some description", label: "some label", partner: "some partner", title: "some title"}
    @update_attrs %{creator: "some updated creator", date: ~D[2011-05-18], description: "some updated description", label: "some updated label", partner: "some updated partner", title: "some updated title"}
    @invalid_attrs %{creator: nil, date: nil, description: nil, label: nil, partner: nil, title: nil}

    def pairing_session_fixture(attrs \\ %{}) do
      {:ok, pairing_session} =
        attrs
        |> Enum.into(@valid_attrs)
        |> PairingSessions.create_pairing_session()

      pairing_session
    end

    test "list_pairing_sessions/0 returns all pairing_sessions" do
      pairing_session = pairing_session_fixture()
      assert PairingSessions.list_pairing_sessions() == [pairing_session]
    end

    test "get_pairing_session!/1 returns the pairing_session with given id" do
      pairing_session = pairing_session_fixture()
      assert PairingSessions.get_pairing_session!(pairing_session.id) == pairing_session
    end

    test "create_pairing_session/1 with valid data creates a pairing_session" do
      assert {:ok, %PairingSession{} = pairing_session} = PairingSessions.create_pairing_session(@valid_attrs)
      assert pairing_session.creator == "some creator"
      assert pairing_session.date == ~D[2010-04-17]
      assert pairing_session.description == "some description"
      assert pairing_session.label == "some label"
      assert pairing_session.partner == "some partner"
      assert pairing_session.title == "some title"
    end

    test "create_pairing_session/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = PairingSessions.create_pairing_session(@invalid_attrs)
    end

    test "update_pairing_session/2 with valid data updates the pairing_session" do
      pairing_session = pairing_session_fixture()
      assert {:ok, %PairingSession{} = pairing_session} = PairingSessions.update_pairing_session(pairing_session, @update_attrs)
      assert pairing_session.creator == "some updated creator"
      assert pairing_session.date == ~D[2011-05-18]
      assert pairing_session.description == "some updated description"
      assert pairing_session.label == "some updated label"
      assert pairing_session.partner == "some updated partner"
      assert pairing_session.title == "some updated title"
    end

    test "update_pairing_session/2 with invalid data returns error changeset" do
      pairing_session = pairing_session_fixture()
      assert {:error, %Ecto.Changeset{}} = PairingSessions.update_pairing_session(pairing_session, @invalid_attrs)
      assert pairing_session == PairingSessions.get_pairing_session!(pairing_session.id)
    end

    test "delete_pairing_session/1 deletes the pairing_session" do
      pairing_session = pairing_session_fixture()
      assert {:ok, %PairingSession{}} = PairingSessions.delete_pairing_session(pairing_session)
      assert_raise Ecto.NoResultsError, fn -> PairingSessions.get_pairing_session!(pairing_session.id) end
    end

    test "change_pairing_session/1 returns a pairing_session changeset" do
      pairing_session = pairing_session_fixture()
      assert %Ecto.Changeset{} = PairingSessions.change_pairing_session(pairing_session)
    end
  end
end
