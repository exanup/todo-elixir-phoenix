defmodule MyTodo.Tasks.Task do
  use Ecto.Schema
  import Ecto.Changeset

  schema "tasks" do
    field :body, :string
    field :is_complete, :boolean, default: false
    field :is_favourite, :boolean, default: false

    timestamps()
  end

  @doc false
  def changeset(task, attrs \\ %{}) do
    task
    |> cast(attrs, [:body, :is_favourite, :is_complete])
    |> validate_required([:body, :is_favourite, :is_complete])
    |> validate_length(:body, min: 10)
  end
end
