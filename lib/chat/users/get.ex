defmodule Chat.Users.Get do
  alias Chat.{Repo, User}

  def call(%{"id" => id}) do
    case Repo.get(User, id) do
      nil -> {:error, :not_found}
      user -> {:ok, user}
    end
  end
end
