defmodule PairProgrammingWeb.LiveHelpers do
  def assign_defaults(%{"user_id" => user_id} = session, socket) do
    socket = assign(socket, current_user: Accounts.get_user!(user_id))

    socket =
      if socket.assigns.current_user.confirmed_at do
        socket
      else
        redirect(socket, to: "/login")
      end

    {:ok, socket}
  end
end
