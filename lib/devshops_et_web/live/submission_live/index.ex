defmodule DevshopsEtWeb.SubmissionLive.Index do
  use DevshopsEtWeb, :live_view

  alias DevshopsEt.Submissions

  @impl true
  def mount(_params, _session, socket) do
    {:ok, stream(socket, :submissions, Submissions.list_submissions())}
  end

  @impl true
  def render(assigns) do
    ~H"""
    <section class="mt-10 mb-96 md:container md:mx-auto grid gap-6">
      <.header class="text-3xl">
        Listing Submissions
      </.header>

      <.table id="submissions" rows={@streams.submissions}>
        <:col :let={{_id, submission}} label="Name"><%= submission.name %></:col>
        <:col :let={{_id, submission}} label="URL"><%= submission.url %></:col>
        <:action :let={{id, submission}}>
          <.link
            phx-click={JS.push("delete", value: %{id: submission.id}) |> hide("##{id}")}
            data-confirm="Are you sure?"
          >
            Delete
          </.link>
        </:action>
      </.table>
    </section>
    """
  end

  @impl true
  def handle_params(params, _url, socket) do
    {:noreply, apply_action(socket, socket.assigns.live_action, params)}
  end

  defp apply_action(socket, :index, _params) do
    socket
    |> assign(:page_title, "Listing Submissions")
    |> assign(:submission, nil)
  end

  @impl true
  def handle_event("delete", %{"id" => id}, socket) do
    submission = Submissions.get_submission!(id)
    {:ok, _} = Submissions.delete_submission(submission)

    {:noreply, stream_delete(socket, :submissions, submission)}
  end
end
