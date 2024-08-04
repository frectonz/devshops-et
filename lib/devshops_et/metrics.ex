defmodule DevshopsEt.Metrics do
  use Supervisor

  @worker DevshopsEt.Metrics.Worker
  @registry DevshopsEt.Metrics.Registry
  @supervisor DevshopsEt.Metrics.WorkerSupervisor

  def start_link(_opts) do
    Supervisor.start_link(__MODULE__, :ok, name: __MODULE__)
  end

  @impl true
  def init(:ok) do
    children = [
      {Registry, keys: :unique, name: @registry},
      {DynamicSupervisor, name: @supervisor, strategy: :one_for_one}
    ]

    Supervisor.init(children, strategy: :one_for_all)
  end

  def bump(path) when is_binary(path) do
    pid =
      case Registry.lookup(@registry, path) do
        [{pid, _}] ->
          pid

        [] ->
          case DynamicSupervisor.start_child(@supervisor, {@worker, path}) do
            {:ok, pid} -> pid
            {:error, {:already_started, pid}} -> pid
          end
      end

    send(pid, :bump)
  end
end
