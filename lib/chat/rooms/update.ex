defmodule Chat.Rooms.Update do
  alias Chat.{Repo, Room}

  def call(%{"id" => id} = params) do
    case Repo.get(Room, id) do
      nil -> {:error, :not_found}
      room -> update(room, params)
    end
  end

  defp update(room, params) do
    room
    |> Room.changeset(params)
    |> Repo.update()
    |> handle_update()
  end

  defp handle_update({:ok, %Room{}} = result), do: result

  defp handle_update({:error, _result}) do
    {:error, :bad_request}
  end
end
