defmodule UserRandomPoints.Users.User do
  use Ecto.Schema

  schema "Users" do
    field(:points, :integer)

    timestamps()
  end
end
