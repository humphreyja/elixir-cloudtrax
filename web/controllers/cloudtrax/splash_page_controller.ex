defmodule ExfiRouter.Cloudtrax.SplashPageController do
  use ExfiRouter.Web, :controller
  require Logger

  def index(conn, _params) do
    Logger.debug "SPlash"
    render conn, "index.html", location: "hnh"
  end
end
