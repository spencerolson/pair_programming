defmodule PairProgrammingWeb.AppointmentsLive do
  use PairProgrammingWeb, :live_view

  alias PairProgrammingWeb.LiveHelpers
  alias PairProgramming.PairingSessions
  alias PairProgramming.PairingSessions.PairingSession
  alias PairProgramming.Users.User

  def mount(_params, session, socket) do
    socket = socket
      |> LiveHelpers.assign_defaults(session)
      |> assign_default_options
    {:ok, socket}
  end

  def handle_event("toggle_menu", _values, socket) do
    socket = assign(socket, show_menu: !socket.assigns.show_menu)
    {:noreply, socket}
  end

  def handle_event("show_pairing_session", _values, socket) do
    IO.puts "handling show_pairing_session!"
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

  defp assign_default_options(socket) do
    assign(
      socket,
      pairing_sessions: PairingSessions.list_pairing_sessions(),
      show_menu: false
    )
  end

  defp status(%PairingSession{partner: partner}) do
    if partner, do: "Scheduled", else: "Open"
  end

  defp status_classes(%PairingSession{partner: partner}) do
    if partner, do: "bg-orange-100 text-orange-800", else: "bg-blue-100 text-blue-800"
  end
end
