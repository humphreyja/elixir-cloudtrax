defmodule ExfiRouter.Cloudtrax.SessionController do
  use ExfiRouter.Web, :controller
  require Logger

  plug ExfiRouter.Plugs.GenerateRa

  def index(conn, _params) do
    render conn, "reject.text", response: conn.assigns.response
  end
end
