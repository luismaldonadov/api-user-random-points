defmodule UserRandomPoints.UsersTest do
  use UserRandomPoints.DataCase

  alias UserRandomPoints.Users

  describe "Users domain" do
    test "returns all users using get_all/0" do
      users = Users.get_all()
      # Amount of users generated on test helper
      assert length(users) == 10
    end

    test "returns at the most 2 users using get_users_gt_points/1" do
      users = Users.get_users_gt_points(0)
      assert length(users) <= 2
    end

    test "returns a changeset error when updating a User using get_users_gt_points/1" do
      [user | _rest] = Users.get_all()
      assert {:error, %Ecto.Changeset{}} = Users.update_user(user, %{points: "A"})
    end
  end
end
