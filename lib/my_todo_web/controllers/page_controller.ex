defmodule MyTodoWeb.PageController do
  use MyTodoWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
