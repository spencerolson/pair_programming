defmodule PairProgrammingWeb.PairingSessionLineItemView do
  use PairProgrammingWeb, :view

  alias PairProgramming.PairingSessions.PairingSession
  alias PairProgramming.Users.User

  defp status(%PairingSession{partner: partner}) do
    if partner, do: "Scheduled", else: "Open"
  end

  defp status_classes(%PairingSession{partner: partner}) do
    if partner, do: "bg-orange-100 text-orange-800", else: "bg-blue-100 text-blue-800"
  end
end
