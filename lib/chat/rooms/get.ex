defmodule Chat.Rooms.Get do
  alias Chat.{Repo, Room}

  def call(%{"id" => id}) do
    case Repo.get(Room, id) do
      nil -> {:error, :not_found}
      room -> {:ok, room}
    end
  end
end
