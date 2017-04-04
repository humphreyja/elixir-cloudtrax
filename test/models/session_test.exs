defmodule ExfiRouter.SessionTest do
  use ExfiRouter.ModelCase

  alias ExfiRouter.Session

  @valid_attrs %{data: %{}, user_id: 1}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Session.changeset(%Session{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Session.changeset(%Session{}, @invalid_attrs)
    refute changeset.valid?
  end
end
