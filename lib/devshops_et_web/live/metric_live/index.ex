defmodule DevshopsEtWeb.MetricLive.Index do
  use DevshopsEtWeb, :live_view

  alias DevshopsEt.MetricsData

  @impl true
  def mount(_params, _session, socket) do
    socket =
      socket
      |> stream_configure(:metrics, dom_id: &"metric-#{&1.date}")
      |> stream(:metrics, MetricsData.list_metrics())

    {:ok, socket}
  end

  @impl true
  def handle_params(params, _url, socket) do
    {:noreply, apply_action(socket, socket.assigns.live_action, params)}
  end

  defp apply_action(socket, :index, _params) do
    socket
    |> assign(:page_title, "Listing Metrics")
    |> assign(:metric, nil)
  end
end
