# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     UserRandomPoints.Repo.insert!(%UserRandomPoints.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

Enum.map(1..100, fn _ ->
  random_points = :rand.uniform(100)
  UserRandomPoints.Repo.insert!(%UserRandomPoints.Users.User{points: random_points})
end)
