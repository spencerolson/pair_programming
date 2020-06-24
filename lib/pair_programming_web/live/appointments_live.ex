defmodule PairProgrammingWeb.AppointmentsLive do
	use PairProgrammingWeb, :live_view

	alias PairProgramming.PairingSessions

	def mount(_params, _session, socket) do
		socket =
			assign(
				socket,
				pairing_sessions: PairingSessions.list_pairing_sessions(),
				show_menu: false
			)
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

	defp status("") do
		"Open"
	end

	defp status(_) do
		"Scheduled"
	end

	defp status_classes(pairing_session) do
		case pairing_session.partner do
			"" -> "bg-green-100 text-green-800"
			_  -> "bg-red-100 text-red-800"
		end
	end
end
