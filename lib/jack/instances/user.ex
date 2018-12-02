defmodule Jack.Instances.User do
  use Ecto.Schema
  import Ecto.Changeset


  schema "users" do
    field :llatitude, :integer
    field :longitude, :integer

    timestamps()
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:llatitude, :longitude])
    |> validate_required([:llatitude, :longitude])
  end
end
