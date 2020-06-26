defmodule PairProgrammingWeb.AppointmentLive do
  use PairProgrammingWeb, :live_view

  alias PairProgrammingWeb.LiveHelpers
  alias PairProgramming.PairingSessions
  alias PairProgramming.PairingSessions.PairingSession

  def mount(_params, session, socket) do
    socket = LiveHelpers.assign_defaults(socket, session)
    changeset = PairingSessions.change_pairing_session(%PairingSession{user_id: socket.assigns.current_user.id})
    socket = assign(socket, changeset: changeset, active_tab: :new_session)
    {:ok, socket}
  end

  def handle_event("validate", %{"pairing_session" => params}, socket) do
    changeset =
      %PairingSession{}
      |> PairingSessions.change_pairing_session(params)
      |> Map.put(:action, :insert)

    {:noreply, assign(socket, changeset: changeset)}
  end

  def handle_event("save", %{"pairing_session" => pairing_session}, socket) do
    case PairingSessions.create_pairing_session(pairing_session) do
      {:ok, _} ->
        {:noreply,
         socket
         |> put_flash(:info, "Pairing Session Created Successfully.")
         |> push_redirect(to: Routes.live_path(socket, PairProgrammingWeb.AppointmentsLive))}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, changeset: changeset)}
    end
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
end
