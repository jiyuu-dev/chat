defmodule Chat.Rooms.Create do
  alias Chat.{Room, Repo}

  def call(params) do
    params
    |> Room.changeset()
    |> Repo.insert()
    |> handle_insert()
  end

  defp handle_insert({:ok, %Room{}} = result), do: result

  defp handle_insert({:error, _result}) do
    {:error, :bad_request}
  end
end
