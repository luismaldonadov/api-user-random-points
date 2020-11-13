defmodule UserRandomPoints.Users.OperationHandler do
  use GenServer

  alias UserRandomPoints.Repo
  alias UserRandomPoints.Users
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
    schedule_users_points_update()
    {:ok, state}
  end

  @doc """
    Get the users that have a greater number than the
    max number state internal property that is set randomly
  """
  def get_users_max_number() do
    GenServer.call(:users_operation_handler, :get_users_max_number)
  end

  @impl true
  def handle_call(
        :get_users_max_number,
        _from,
        %{max_number: max_number, timestamp: timestamp} = state
      ) do
    users = Users.get_users_points_gt(max_number)

    response = %{users: users, timestamp: timestamp}
    new_state = Map.put(state, :timestamp, DateTime.utc_now())
    {:reply, response, new_state}
  end

  @impl true
  def handle_info(:update_users_points, state) do
    User
    |> Repo.all()
    |> Enum.each(fn user ->
      random_point_number = :rand.uniform(@max_number)

      Users.update_user(user, %{points: random_point_number})
    end)

    schedule_users_points_update()

    state = Map.put(state, :max_number, :rand.uniform(@max_number))
    {:noreply, state}
  end

  defp schedule_users_points_update() do
    Process.send_after(
      :users_operation_handler,
      :update_users_points,
      @update_users_points_after_ms
    )
  end
end
