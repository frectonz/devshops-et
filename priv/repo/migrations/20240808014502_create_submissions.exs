defmodule DevshopsEt.Repo.Migrations.CreateSubmissions do
  use Ecto.Migration

  def change do
    create table(:submissions) do
      add :name, :string
      add :url, :string

      timestamps(type: :utc_datetime)
    end
  end
end
