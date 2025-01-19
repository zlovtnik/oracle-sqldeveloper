defmodule TasksApp.TasksFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `TasksApp.Tasks` context.
  """

  @doc """
  Generate a task.
  """
  def task_fixture(attrs \\ %{}) do
    {:ok, task} =
      attrs
      |> Enum.into(%{
        description: "some description",
        title: "some title"
      })
      |> TasksApp.Tasks.create_task()

    task
  end
end
