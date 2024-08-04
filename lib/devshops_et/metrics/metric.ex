defmodule DevshopsEt.Metrics.Metric do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key false
  schema "metrics" do
    field :date, :date, primary_key: true
    field :path, :string, primary_key: true
    field :counter, :integer, default: 0
  end

  @doc false
  def changeset(metric, attrs) do
    metric
    |> cast(attrs, [:date, :path, :counter])
    |> validate_required([:date, :path, :counter])
  end
end
