defmodule Chat.Rooms.Delete do
  alias Chat.{Repo, Room}

  def call(%{"id" => id}) do
    case Repo.get!(Room, id) do
      nil -> {:error, :not_found}
      room -> delete_room(room)
    end
  end

  defp delete_room(room) do
    room
    |> Repo.delete()
    |> handle_delete()
  end

  defp handle_delete({:ok, %Room{}} = result), do: result

  defp handle_delete({:error, _result}) do
    {:error, :bad_request}
  end
end
