defmodule Chat.Room do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "rooms" do
    field :password, :string
    field :public_uuid, Ecto.UUID

    timestamps()
  end

  @doc false
  def changeset(room, attrs) do
    room
    |> cast(attrs, [:password])
  end

  def changeset(attrs) do
    %__MODULE__{
      public_uuid: Ecto.UUID.generate()
    }
    |> cast(attrs, [:public_uuid, :password])
    |> validate_required([:public_uuid])
  end
end
