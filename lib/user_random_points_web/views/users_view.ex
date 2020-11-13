defmodule UserRandomPointsWeb.UserRandomPointsView do
  use UserRandomPointsWeb, :view

  alias UserRandomPointsWeb.UserRandomPointsView

  def render("show.json", %{users_operations: users_operations}) do
    %{users: users, timestamp: timestamp} = users_operations

    %{
      users: render_many(users, UserRandomPointsView, "user.json"),
      timestamp: timestamp
    }
  end

  def render("user.json", %{user_random_points: user}) do
    %{
      id: user.id,
      points: user.points
    }
  end
end
