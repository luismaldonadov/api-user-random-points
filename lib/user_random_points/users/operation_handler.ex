defmodule UserRandomPoints.Users.OperationHandler do
  use GenServer
  require Logger

  alias UserRandomPoints.Repo
  alias UserRandomPoints.Users.User

  @max_number 100
  @update_users_points_after_ms 60 * 1000

  def start_link(_) do
    random_max_number = :rand.uniform(@max_number)

    GenServer.start_link(__MODULE__, %{max_number: random_max_number, timestamp: nil},
      name: :users_operation_handler
    )
  end

  @impl true
  def init(state) do
    Process.send_after(self(), :update_users_points, @update_users_points_after_ms)
    {:ok, state}
  end

  @impl true
  def handle_info(:update_users_points, state) do
    modified_users =
      User
      |> Repo.all()
      |> Enum.each(fn user ->
        random_point_number = :rand.uniform(@max_number)

        user
        |> User.changeset(%{points: random_point_number})
        |> Repo.update()
      end)

    Process.send_after(self(), :update_users_points, @update_users_points_after_ms)
    {:noreply, Map.put(state, :max_number, :rand.uniform(@max_number))}
  end
end
