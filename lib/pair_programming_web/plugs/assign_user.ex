defmodule PairProgramming.AssignUser do
  import Plug.Conn

  def init(opts), do: opts

  def call(conn, _params) do
    put_session(conn, "user_id", conn.assigns.current_user.id)
  end
end