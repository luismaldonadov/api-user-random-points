defmodule UserRandomPoints.Users.OperationHandler do
  use GenServer

  @max_number 100

  def start_link do
    random_max_number = :rand.uniform(@max_number)

    GenServer.start_link(__MODULE__, %{max_number: random_max_number, timestamp: nil},
      name: :users_operation_handler
    )
  end

  @impl true
  def init(state) do
    {:ok, state}
  end
end
