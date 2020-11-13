defmodule UserRandomPointsWeb.UserRandomPointsControllerTest do
  use UserRandomPointsWeb.ConnCase

  describe "GET /" do
    # user_random_points_path
    test "returns users with timestamp", %{conn: conn} do
      conn =
        get(
          conn,
          Routes.user_random_points_path(conn, :show)
        )

      assert %{"timestamp" => timestamp, "users" => users} = json_response(conn, 200)
      assert length(users) <= 2
    end
  end
end
