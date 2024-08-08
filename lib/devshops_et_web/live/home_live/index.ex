defmodule DevshopsEtWeb.HomeLive.Index do
  use DevshopsEtWeb, :live_view

  alias DevshopsEt.Companies

  @impl true
  def mount(_params, _session, socket) do
    socket =
      socket
      |> assign(:companies, Companies.list_companies())

    {:ok, socket}
  end
end
