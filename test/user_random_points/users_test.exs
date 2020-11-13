defmodule UserRandomPoints.UsersTest do
  use UserRandomPoints.DataCase

  alias UserRandomPoints.Users

  describe "Users domain" do
    test "returns all users on get_all/0" do
      users = Users.get_all()
      assert length(users) == 10
    end
  end
end
