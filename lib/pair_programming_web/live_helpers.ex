defmodule PairProgrammingWeb.LiveHelpers do
  import Phoenix.LiveView
  alias PairProgramming.Accounts

  def assign_defaults(socket, %{"user_id" => user_id}) do
    socket = assign_new(socket, :current_user,fn -> Accounts.get_user!(user_id) end)

    if socket.assigns.current_user do
      assign(socket, show_menu: false)
    else
      redirect(socket, to: "/")
    end
  end

  def handle_event("toggle_menu", _values, socket) do
    socket = assign(socket, show_menu: !socket.assigns.show_menu)
    {:noreply, socket}
  end

  def handle_event("close_menu", _values, socket) do
    # delay closing in case menu options are being clicked (in
    # which case we don't to close before those clicks register)
    Process.send_after(self(), :close_menu, 120)
    {:noreply, socket}
  end

  def handle_info(:close_menu, socket) do
    socket = case socket.assigns.show_menu do
      false -> socket
      true -> assign(socket, show_menu: false)
    end

    {:noreply, socket}
  end
end
