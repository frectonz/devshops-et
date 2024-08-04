defmodule DevshopsEt.MetricsData do
  @moduledoc """
  The MetricsData context.
  """

  import Ecto.Query, warn: false
  alias DevshopsEt.Repo

  alias DevshopsEt.Metrics.Metric

  @doc """
  Returns the list of metrics.

  ## Examples

      iex> list_metrics()
      [%Metric{}, ...]

  """
  def list_metrics do
    Repo.all(Metric)
  end

  @doc """
  Gets a single metric.

  Raises `Ecto.NoResultsError` if the Metric does not exist.

  ## Examples

      iex> get_metric!(123)
      %Metric{}

      iex> get_metric!(456)
      ** (Ecto.NoResultsError)

  """
  def get_metric!(id), do: Repo.get!(Metric, id)
end
