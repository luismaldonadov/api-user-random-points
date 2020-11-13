defmodule UserRandomPoints.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      UserRandomPoints.Repo,
      # Start the Telemetry supervisor
      UserRandomPointsWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: UserRandomPoints.PubSub},
      # Start the Endpoint (http/https)
      UserRandomPointsWeb.Endpoint,
      # Start a worker by calling: UserRandomPoints.Worker.start_link(arg)
      # {UserRandomPoints.Worker, arg}
      # Start the User operation handler GenServer process
      UserRandomPoints.Users.OperationHandler
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: UserRandomPoints.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  def config_change(changed, _new, removed) do
    UserRandomPointsWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
