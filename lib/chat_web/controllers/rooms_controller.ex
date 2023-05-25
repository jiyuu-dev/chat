defmodule ChatWeb.RoomsController do
  use ChatWeb, :controller

  alias ChatWeb.FallbackController
  alias Chat.Repo
  alias Chat.Room

  action_fallback FallbackController

  def index(conn, _params) do
    with rooms <- Repo.all(Room) do
      conn
      |> put_status(:ok)
      |> json(%{rooms: rooms})
    end
  end

  def show(conn, params) do
    with {:ok, room} <- Room.get(params) do
      conn
      |> put_status(:ok)
      |> json(%{room: room})
    end
  end

  def delete(conn, params) do
    with {:ok, room} <- Room.delete(params) do
      conn
      |> put_status(:ok)
      |> json(%{room: room})
    end
  end

  def create(conn, params) do
    with {:ok, room} <- Room.create(params) do
      conn
      |> put_status(:created)
      |> json(%{room: room})
    end
  end

  def update(conn, params) do
    with {:ok, room} <- Room.update(params) do
      conn
      |> put_status(:ok)
      |> json(%{room: room})
    end
  end
end
