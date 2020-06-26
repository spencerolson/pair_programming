defmodule PairProgrammingWeb.PairingSessionLive do
	use PairProgrammingWeb, :live_view

	alias PairProgramming.PairingSessions

	def mount(_params, _session, socket) do
		socket =
			assign(
				socket,
				pairing_sessions: PairingSessions.list_pairing_sessions()
			)
		{:ok, socket}
	end

	def render(assigns) do
		~L"""
    <h1>Pairing Sessions</h1>
    <div id="filter">
      <div class="boats">
        <%= for pairing_session <- @pairing_sessions do %>
          <div class="card">
            <img src="/images/1650-super-hawk.jpg">
            <div class="content">
              <div class="model">
                <%= pairing_session.title %>
              </div>
              <div class="details">
                <span class="price">
                  <%= pairing_session.user.email %>
                </span>
                <span class="type">
                  <%= pairing_session.tags %>
                </span>
              </div>
            </div>
          </div>
        <% end %>
      </div>
    </div>
    """
	end
end
