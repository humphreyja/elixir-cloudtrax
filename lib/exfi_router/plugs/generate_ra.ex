defmodule ExfiRouter.Plugs.GenerateRa do
  import Plug.Conn
  require Logger

  alias ExfiRouter.Cloudtrax.RaGenerator

  @secret "fargo"
  @reject "REJECT"
  @accept "ACCEPT"
  @account "OK"

  def init(options), do: options

  def call(%Plug.Conn{params: %{"type" => "status"}} = conn, _default) do
    handle_request(conn, @reject)
  end

  def call(%Plug.Conn{params: %{"type" => "acct"}} = conn, _default) do
    handle_request(conn, @account)
  end

  def call(%Plug.Conn{params: %{"type" => "login"}} = conn, _default) do
    handle_request(conn, @accept)
  end

  def call(conn, _default), do: request_error!(conn)

  defp handle_request(conn, response) do
    case build_ra_from_params(conn.params, response) do
      :error ->
        request_error!(conn)
      ra ->
        assign(conn, :response, response)
          |> assign(:ra, ra)
    end
  end

  defp build_ra_from_params(%{"ra" => ra}, code) do
    generate_ra(ra, code, @secret)
  end

  defp build_ra_from_params(_ra, _code), do: :error


  defp generate_ra(ra, code, secret) do
    RaGenerator.generate(ra, code, secret)
  end

  defp request_error!(conn) do
    Logger.debug "Invalid Type Request: #{inspect conn.params}"
    conn
    |> put_status(:unauthorized)
    |> Phoenix.Controller.render(ExfiRouter.ErrorView, "404.html", %{message: "Invalid Request"})
    |> halt
  end
end
