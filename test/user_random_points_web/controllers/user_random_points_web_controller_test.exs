defmodule UserRandomPointsWeb.UserRandomPointsControllerTest do
  use UserRandomPointsWeb.ConnCase

  describe "GET /" do
    test "returns users with timestamp", %{conn: conn} do
      conn =
        get(
          conn,
          Routes.user_random_points_path(conn, :show)
        )

      assert %{"users" => users} = json_response(conn, 200)
      assert length(users) <= 2
    end
  end
end
