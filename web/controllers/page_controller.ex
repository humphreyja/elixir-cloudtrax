defmodule ExfiRouter.PageController do
  use ExfiRouter.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
