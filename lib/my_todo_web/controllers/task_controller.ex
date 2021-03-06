defmodule MyTodoWeb.TaskController do
  use MyTodoWeb, :controller

  alias MyTodo.Tasks
  alias MyTodo.Tasks.Task

  def index(conn, _params) do
    tasks = Tasks.list_tasks()
    changeset = Task.changeset(%Task{})

    render(conn, "index.html", tasks: tasks, changeset: changeset)
  end

  def create(conn, %{"task" => task_params}) do
    case Tasks.create_task(task_params) do
      {:ok, _task} ->
        conn
        |> put_flash(:success, "Task created successfully.")
        |> redirect(to: Routes.task_path(conn, :index))

      {:error, %Ecto.Changeset{} = changeset} ->
        tasks = Tasks.list_tasks()

        conn
        |> put_flash(:error, "Could not create a new task.")
        |> render("index.html", tasks: tasks, changeset: changeset)
    end
  end

  def update(conn, %{"id" => id, "task" => task_params}) do
    task = Tasks.get_task!(id)

    case Tasks.update_task(task, task_params) do
      {:ok, _task} ->
        conn
        |> put_flash(:info, "Task updated successfully.")
        |> redirect(to: Routes.task_path(conn, :index))

      {:error, %Ecto.Changeset{} = changeset} ->
        tasks = Tasks.list_tasks()

        conn
        |> put_flash(:error, "Could not update the given task.")
        |> render("index.html", tasks: tasks, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    task = Tasks.get_task!(id)
    {:ok, _task} = Tasks.delete_task(task)

    conn
    |> put_flash(:info, "Task deleted successfully.")
    |> redirect(to: Routes.task_path(conn, :index))
  end
end
