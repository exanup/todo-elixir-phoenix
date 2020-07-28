defmodule MyTodoWeb.PageController do
  use MyTodoWeb, :controller

  def index(conn, _params) do
    redirect(conn, to: Routes.task_path(conn, :index))
  end
end
