defmodule PairProgrammingWeb.LiveHelpers do
  import Phoenix.LiveView
  alias PairProgramming.Accounts

  def assign_defaults(socket, %{"user_id" => user_id}) do
    socket = assign_new(socket, :current_user,fn -> Accounts.get_user!(user_id) end)

    if socket.assigns.current_user do
      socket
    else
      redirect(socket, to: "/")
    end
  end
end
