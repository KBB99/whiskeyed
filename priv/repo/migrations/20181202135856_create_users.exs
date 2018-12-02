defmodule Jack.Repo.Migrations.CreateUsers do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :llatitude, :integer
      add :longitude, :integer

      timestamps()
    end

  end
end
