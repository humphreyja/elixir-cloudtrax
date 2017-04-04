defmodule ExfiRouter.Cloudtrax.SessionControllerTest do
  use ExfiRouter.ConnCase

  test "GET cloudtrax status request", %{conn: conn} do
    conn = get conn, "/cloudtrax/sessions?type=status&ra=12345abcd"
    assert text_response(conn, 200) =~
    "
    \"CODE\" \"REJECT\"
    \"RA\" \"ab35c60b6033dc075134728c474ab4c9\"
    "
  end
end
