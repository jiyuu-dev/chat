defmodule Chat.Users.Delete do
  alias Chat.{Repo, User}

  def call(%{"id" => id}) do
    case Repo.get!(User, id) do
      nil -> {:error, :not_found}
      user -> delete_user(user)
    end
  end

  defp delete_user(user) do
    user
    |> Repo.delete()
    |> handle_delete()
  end

  defp handle_delete({:ok, %User{}} = result), do: result

  defp handle_delete({:error, _result}) do
    {:error, :bad_request}
  end
end
