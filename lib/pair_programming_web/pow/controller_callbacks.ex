defmodule PairProgrammingWeb.Pow.ControllerCallbacks do
  use Pow.Extension.Phoenix.ControllerCallbacks.Base

  def before_process(Pow.Phoenix.SessionController, :delete, conn, _config) do
    user = Pow.Plug.current_user(conn)
    PairProgrammingWeb.Endpoint.broadcast("users_socket:#{user.id}", "disconnect", %{})
    conn
  end
end
