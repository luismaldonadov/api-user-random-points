defmodule UserRandomPoints.Repo.Migrations.CreateUsersTable do
  use Ecto.Migration

  def up do
    create table("Users") do
      add(:points, :integer)

      timestamps()
    end
  end

  def down do
    drop(table("Users"))
  end
end
