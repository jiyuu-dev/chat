defmodule Chat.User do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id

  @columns [:nickname]
  @derive {Jason.Encoder, only: [:id, :nickname]}

  schema "users" do
    field :nickname, :string

    timestamps()
  end

  @doc false
  def changeset(attrs) do
    %__MODULE__{}
    |> cast(attrs, @columns)
    |> validate_required(@columns)
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, @columns)
    |> validate_required(@columns)
  end
end
