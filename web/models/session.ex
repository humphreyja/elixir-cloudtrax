defmodule ExfiRouter.Session do
  use ExfiRouter.Web, :model

  schema "session" do
    field :data, :map
    belongs_to :user, ExfiRouter.User
    has_many :sessions, ExfiRouter.Session

    timestamps()
  end

  @required_fields ~w(data user_id)
  @optional_fields ~w()

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, @required_fields, @optional_fields)
  end
end
