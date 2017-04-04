defmodule ExfiRouter.Cloudtrax.SessionView do
  use ExfiRouter.Web, :view
  require Logger

  def render("reject.text", %{ra: ra}) do
    Logger.debug "Sending REJECT"
    '
    "CODE" "REJECT"
    "RA" "#{ra}"
    '
  end
end
