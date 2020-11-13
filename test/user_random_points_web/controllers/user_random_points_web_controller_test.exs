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

    test "returns users with timestamp that is not nil", %{conn: conn} do
      conn =
        get(
          conn,
          Routes.user_random_points_path(conn, :show)
        )

      conn =
        get(
          conn,
          Routes.user_random_points_path(conn, :show)
        )

      # By making 2 requests, we guarantee that timestamp is not nil
      # regardelss of test order

      assert %{"users" => users, "timestamp" => timestamp} = json_response(conn, 200)
      assert length(users) <= 2
      assert {:ok, %DateTime{}, 0} = DateTime.from_iso8601(timestamp)
    end
  end
end
