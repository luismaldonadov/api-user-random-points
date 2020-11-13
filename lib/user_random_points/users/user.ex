defmodule UserRandomPoints.Users.User do
  use Ecto.Schema
  import Ecto.Changeset

  alias UserRandomPoints.Users.User

  schema "Users" do
    field(:points, :integer)
    timestamps()
  end

  def changeset(%User{} = user, attrs) do
    user
    |> cast(attrs, [:points])
    |> validate_required(:points)
    |> validate_number(:points, greater_than: 0, less_than: 100)
  end
end
