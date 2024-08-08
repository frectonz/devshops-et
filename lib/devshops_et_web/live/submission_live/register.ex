defmodule DevshopsEtWeb.SubmissionLive.Register do
  use DevshopsEtWeb, :live_view

  alias DevshopsEt.Submissions
  alias DevshopsEt.Submissions.Submission

  @impl true
  def mount(_params, _session, socket) do
    {:ok, socket |> init_submission()}
  end

  @impl true
  def render(assigns) do
    ~H"""
    <section class="border border-black my-1 px-4 py-20 md:container md:mx-auto bg-green-300 grid grid-cols-1 md:grid-cols-2 gap-4">
      <div class="flex items-start justify-center flex-col gap-8">
        <h1 class="text-5xl">Add a Company to the Catalog.</h1>
        <p class="text-xl">
          Your submission will be sent to the admins. The comapny will be listed on the website after verification.
        </p>

        <.simple_form for={@form} id="submission-form" phx-change="validate" phx-submit="save">
          <.input field={@form[:name]} type="text" label="Name" />
          <.input field={@form[:url]} type="url" label="URL" />
          <:actions>
            <.button phx-disable-with="Saving...">Send Submission</.button>
          </:actions>
        </.simple_form>
      </div>
      <div class="hidden md:flex items-center justify-center">
        <img
          src={~p"/images/EthiopianShield.svg"}
          width="500"
          class="drop-shadow-2xl animate-spin-slow"
        />
      </div>
    </section>
    """
  end

  @impl true
  def handle_event("validate", %{"submission" => submission_params}, socket) do
    changeset = Submissions.change_submission(socket.assigns.submission, submission_params)
    {:noreply, assign(socket, form: to_form(changeset, action: :validate))}
  end

  def handle_event("save", %{"submission" => submission_params}, socket) do
    save_submission(socket, submission_params)
  end

  defp init_submission(socket) do
    submission = %Submission{}

    socket
    |> assign(:submission, submission)
    |> assign(:form, submission |> Submissions.change_submission() |> to_form())
  end

  defp save_submission(socket, submission_params) do
    case Submissions.create_submission(submission_params) do
      {:ok, _submission} ->
        {:noreply,
         socket
         |> put_flash(:info, "Submission created successfully")
         |> init_submission()}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, form: to_form(changeset))}
    end
  end
end
