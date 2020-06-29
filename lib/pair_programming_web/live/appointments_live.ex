defmodule PairProgrammingWeb.AppointmentsLive do
  use PairProgrammingWeb, :live_view

  alias PairProgrammingWeb.LiveHelpers
  alias PairProgrammingWeb.PairingSessionLineItemView
  alias PairProgramming.PairingSessions

  def mount(_params, session, socket) do
    if connected?(socket) do
      PairingSessions.subscribe()
      Process.send_after(self(), :hide_flash, :timer.seconds(3))
    end

    socket = socket
      |> LiveHelpers.assign_defaults(session)
      |> assign(pairing_sessions: PairingSessions.list_pairing_sessions(), active_tab: :all_sessions)

    {:ok, socket}
  end

  def handle_event("show_pairing_session", _values, socket) do
    {:noreply, socket}
  end

  def handle_event("toggle_menu" = event, values, socket) do
    LiveHelpers.handle_event(event, values, socket)
  end

  def handle_event("close_menu" = event, values, socket) do
    LiveHelpers.handle_event(event, values, socket)
  end

  def handle_info(:close_menu = message, socket) do
    LiveHelpers.handle_info(message, socket)
  end

  def handle_info(:hide_flash, socket) do
    {:noreply, clear_flash(socket)}
  end

  def handle_info({:pairing_session_created, pairing_session}, socket) do
    {
      :noreply,
      update(
        socket,
        :pairing_sessions,
        fn pairing_sessions -> [pairing_session | pairing_sessions] end
      )
    }
  end
end
