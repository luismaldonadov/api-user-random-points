defmodule UserRandomPointsWeb.Router do
  use UserRandomPointsWeb, :router

  pipeline :api do
    plug(:accepts, ["json"])
  end

  scope "/", UserRandomPointsWeb do
    pipe_through(:api)
    get("/", UserRandomPointsController, :show)
  end
end
