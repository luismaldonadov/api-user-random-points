defmodule UserRandomPoints.Users.OperationHandlerTest do
  use UserRandomPoints.DataCase

  alias UserRandomPoints.Users.OperationHandler

  describe "get_users_max_number" do
    test "returns a list with 2 Users at the most, and a timestamp" do
      %{timestamp: _timestamp, users: users} = OperationHandler.get_users_max_number()

      assert length(users) <= 2
    end
  end
end
