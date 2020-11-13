defmodule UserRandomPoints.Users do
  import Ecto.Query, warn: false

  alias UserRandomPoints.Repo
  alias UserRandomPoints.Users.User

  @doc """
    Updates an existing `User` with a map of attributes
    ## Examples

      iex(1)> UserRandomPoints.Users.update_user(%User{}, %{points: 12})
      {:ok, %User{}}

      iex(1)> UserRandomPoints.Users.update_user(%User{}, %{points: 12})
      {:error, Ecto.Changeset}
  """
  @spec update_user(User.t(), map) :: {:ok, %User{}} | {:error, Ecto.Changeset}
  def update_user(%User{} = user, attrs) do
    user
    |> User.changeset(attrs)
    |> Repo.update()
  end

  @doc """
    Gets at the most 2 `User` structs, when User.points
    greater than provided number

    ## Examples

      iex(1)> UserRandomPoints.Users.get_users_gt_points(23)
      [
        %UserRandomPoints.Users.User{
          __meta__: #Ecto.Schema.Metadata<:loaded, "Users">,
          id: 72,
          inserted_at: ~N[2020-11-13 03:45:47],
          points: 75,
          updated_at: ~N[2020-11-13 04:54:04]
        },
        %UserRandomPoints.Users.User{
          __meta__: #Ecto.Schema.Metadata<:loaded, "Users">,
          id: 73,
          inserted_at: ~N[2020-11-13 03:45:47],
          points: 39,
          updated_at: ~N[2020-11-13 04:54:04]
        }
      ]
      iex(1)> UserRandomPoints.Users.get_users_gt_points(100)
      []
  """
  @spec get_users_gt_points(integer()) :: [%User{}] | []
  def get_users_pointget_users_gt_pointss_gt(number) do
    User
    |> where([usr], usr.points > ^number)
    |> limit(2)
    |> Repo.all()
  end

  @doc """
    Get all Users

    ## Examples

      iex(1)> UserRandomPoints.Users.get_all_users()
      [
        %UserRandomPoints.Users.User{
          __meta__: #Ecto.Schema.Metadata<:loaded, "Users">,
          id: 72,
          inserted_at: ~N[2020-11-13 03:45:47],
          points: 75,
          updated_at: ~N[2020-11-13 04:54:04]
        },
        %UserRandomPoints.Users.User{
          __meta__: #Ecto.Schema.Metadata<:loaded, "Users">,
          id: 73,
          inserted_at: ~N[2020-11-13 03:45:47],
          points: 39,
          updated_at: ~N[2020-11-13 04:54:04]
        }
        .......
      ]
      iex(1)> UserRandomPoints.Users.get_all_users()
      []
  """
  @spec get_all_users() :: [%User{}] | []
  def get_all_users() do
    User
    |> Repo.all()
  end
end
