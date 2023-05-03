defmodule ChatWeb.UsersController do
  use ChatWeb, :controller

  alias ChatWeb.FallbackController
  alias Chat.Repo
  alias Chat.User

  action_fallback FallbackController

  def index(conn, _params) do
    with users <- Repo.all(User) do
      conn
      |> put_status(:ok)
      |> json(%{users: users})
    end
  end

  def show(conn, params) do
    with {:ok, user} <- Chat.get_user(params) do
      conn
      |> put_status(:ok)
      |> json(%{user: user})
    end
  end

  def delete(conn, params) do
    with {:ok, user} <- Chat.delete_user(params) do
      conn
      |> put_status(:ok)
      |> json(%{user: user})
    end
  end

  def create(conn, params) do
    with {:ok, user} <- Chat.create_user(params) do
      conn
      |> put_status(:created)
      |> json(%{user: user})
    end
  end

  def update(conn, params) do
    with {:ok, user} <- Chat.update_user(params) do
      conn
      |> put_status(:ok)
      |> json(%{user: user})
    end
  end
end
