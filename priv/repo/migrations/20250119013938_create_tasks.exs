defmodule TasksApp.Repo.Migrations.CreateTasks do
  use Ecto.Migration

  def change do
    create table(:tasks) do
      add :title, :string
      add :description, :text

      timestamps(type: :utc_datetime)
    end
  end
end
