defmodule ExfiRouter.Cloudtrax.PasswordSerializerTest do
  use ExUnit.Case, async: true

  alias ExfiRouter.Cloudtrax.Password
  @password "password123"
  @secret "fargo"
  @challenge "1234abcd"
  @expected "67b0d1651248418ee5ae0f34"

  test "challenges with odd number of characters fail", _ do
    refute Password.encode(@password, "odd", @secret)
  end

  test "password encodes correctly", _ do
    assert Password.encode(@password, @challenge, @secret) == @expected
  end
end
