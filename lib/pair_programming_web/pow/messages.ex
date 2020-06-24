defmodule PairProgrammingWeb.Pow.Messages do
  use Pow.Phoenix.Messages
  use Pow.Extension.Phoenix.Messages,
    extensions: [PowResetPassword]

  import PairProgrammingWeb.Gettext

  def invalid_credentials(_conn) do
    "Invalid credentails. Please try again."
  end

  # Message methods for extensions has to be prepended with the snake cased
  # extension name. So the `email_has_been_sent/1` method from
  # `PowResetPassword` is written as `pow_reset_password_email_has_been_sent/1`
  # in your messages module.
  # def pow_reset_password_email_has_been_sent(_conn), do: gettext("An email with reset instructions has been sent to you. Please check your inbox.")
end