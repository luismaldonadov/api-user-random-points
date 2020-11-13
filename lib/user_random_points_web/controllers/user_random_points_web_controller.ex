defmodule UserRandomPointsWeb.UserRandomPointsController do
  use UserRandomPointsWeb, :controller

  alias UserRandomPoints.Users.OperationHandler

  def show(conn, _params) do
    users_operations = OperationHandler.get_users_max_number()
    render(conn, "show.json", users_operations: users_operations)
  end
end
