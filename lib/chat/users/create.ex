defmodule Chat.Users.Create do
  alias Chat.{User, Repo}

  def call(params) do
    params
    |> User.changeset()
    |> Repo.insert()
    |> handle_insert()
  end

  defp handle_insert({:ok, %User{}} = result), do: result

  defp handle_insert({:error, _result}) do
    {:error, :bad_request}
  end
end
