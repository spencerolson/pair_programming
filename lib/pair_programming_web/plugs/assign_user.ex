defmodule PairProgramming.AssignUser do
  import Plug.Conn

  def init(opts), do: opts

  def call(conn, _params) do
    user = Pow.Plug.current_user(conn)

    conn
    |> put_session("user_id", user.id)
    |> put_session("live_socket_id", "users_socket:#{user.id}")
  end
end