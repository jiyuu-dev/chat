defmodule Chat do
  defdelegate create_user(params), to: Chat.Users.Create, as: :call
  defdelegate update_user(params), to: Chat.Users.Update, as: :call
  defdelegate delete_user(params), to: Chat.Users.Delete, as: :call
  defdelegate get_user(params), to: Chat.Users.Get, as: :call
end
