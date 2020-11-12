defmodule UserRandomPoints.Repo do
  use Ecto.Repo,
    otp_app: :user_random_points,
    adapter: Ecto.Adapters.Postgres
end
