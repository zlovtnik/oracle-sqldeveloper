defmodule OracleSqldeveloperWeb.CrudController do
  use OracleSqldeveloperWeb, :controller

  alias OracleSqldeveloper.Repo
  alias OracleSqldeveloperWeb.Crud

  def index(conn, _params) do
    items = Repo.all(Crud)
    render(conn, "index.html", items: items)
  end

  def show(conn, %{"id" => id}) do
    item = Repo.get!(Crud, id)
    render(conn, "show.html", item: item)
  end

  def new(conn, _params) do
    changeset = Crud.changeset(%Crud{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"crud" => crud_params}) do
    changeset = Crud.changeset(%Crud{}, crud_params)

    case Repo.insert(changeset) do
      {:ok, _item} ->
        conn
        |> put_flash(:info, "Item created successfully.")
        |> redirect(to: Routes.crud_path(conn, :index))

      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def edit(conn, %{"id" => id}) do
    item = Repo.get!(Crud, id)
    changeset = Crud.changeset(item)
    render(conn, "edit.html", item: item, changeset: changeset)
  end

  def update(conn, %{"id" => id, "crud" => crud_params}) do
    item = Repo.get!(Crud, id)
    changeset = Crud.changeset(item, crud_params)

    case Repo.update(changeset) do
      {:ok, _item} ->
        conn
        |> put_flash(:info, "Item updated successfully.")
        |> redirect(to: Routes.crud_path(conn, :show, item))

      {:error, changeset} ->
        render(conn, "edit.html", item: item, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    item = Repo.get!(Crud, id)
    {:ok, _item} = Repo.delete(item)

    conn
    |> put_flash(:info, "Item deleted successfully.")
    |> redirect(to: Routes.crud_path(conn, :index))
  end
end
