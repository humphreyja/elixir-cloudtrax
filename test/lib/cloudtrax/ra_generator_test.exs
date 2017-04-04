defmodule ExfiRouter.Cloudtrax.RaGeneratorTest do
  use ExUnit.Case, async: true

  test "ra generates valid ra", _ do
    ra = "12345abcd"
    secret = "fargo"
    code = "REJECT"
    expected = "ab35c60b6033dc075134728c474ab4c9"
    assert ExfiRouter.Cloudtrax.RaGenerator.generate(ra, code, secret) == expected
  end

end
