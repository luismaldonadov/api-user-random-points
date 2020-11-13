ExUnit.start()

Enum.map(1..10, fn _ ->
  random_points = :rand.uniform(100)
  UserRandomPoints.Repo.insert!(%UserRandomPoints.Users.User{points: random_points})
end)

Ecto.Adapters.SQL.Sandbox.mode(UserRandomPoints.Repo, :manual)
