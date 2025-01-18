defmodule OracleSqldeveloperWeb.Crud do
  use Ecto.Schema
  import Ecto.Changeset

  schema "cruds" do
    field :name, :string
    field :description, :string
    timestamps()
  end

  def changeset(crud, attrs) do
    crud
    |> cast(attrs, [:name, :description])
    |> validate_required([:name, :description])
  end
end
