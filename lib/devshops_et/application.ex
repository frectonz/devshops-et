defmodule DevshopsEt.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      DevshopsEtWeb.Telemetry,
      DevshopsEt.Repo,
      {DNSCluster, query: Application.get_env(:devshops_et, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: DevshopsEt.PubSub},
      # Start the Finch HTTP client for sending emails
      {Finch, name: DevshopsEt.Finch},
      # Start a worker by calling: DevshopsEt.Worker.start_link(arg)
      # {DevshopsEt.Worker, arg},
      # Start to serve requests, typically the last entry
      DevshopsEtWeb.Endpoint
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: DevshopsEt.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    DevshopsEtWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
