defmodule Chat.Repo.Migrations.CreateRooms do
  use Ecto.Migration

  def change do
    create table(:rooms, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :public_uuid, :uuid
      add :password, :string

      timestamps()
    end

    create unique_index("rooms", [:public_uuid])
  end
end
