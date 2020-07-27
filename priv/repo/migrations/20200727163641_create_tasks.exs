defmodule MyTodo.Repo.Migrations.CreateTasks do
  use Ecto.Migration

  def change do
    create table(:tasks) do
      add :body, :text
      add :is_favourite, :boolean, default: false, null: false
      add :is_complete, :boolean, default: false, null: false

      timestamps()
    end

  end
end
