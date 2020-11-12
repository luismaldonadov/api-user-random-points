defmodule UserRandomPointsWeb.Router do
  use UserRandomPointsWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", UserRandomPointsWeb do
    pipe_through :api
  end
end
