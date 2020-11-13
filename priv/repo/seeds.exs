# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs

Enum.map(1..100, fn _ ->
  random_points = :rand.uniform(100)
  UserRandomPoints.Repo.insert!(%UserRandomPoints.Users.User{points: random_points})
end)
