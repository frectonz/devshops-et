defmodule DevshopsEtWeb.HomeLive.Contact do
  use DevshopsEtWeb, :live_view

  alias DevshopsEt.Messages
  alias DevshopsEt.Messages.Message

  @impl true
  def mount(_params, _session, socket) do
    {:ok, socket |> assign(:page_title, "Contact") |> init_message()}
  end

  @impl true
  def render(assigns) do
    ~H"""
    <section class="border border-black my-1 px-4 py-20 md:container md:mx-auto bg-green-300 grid grid-cols-1 md:grid-cols-2 gap-4">
      <div class="flex items-start justify-center flex-col gap-8">
        <h1 class="text-5xl">Contact Us.</h1>
        <p class="text-xl">Use the following form to send us a message.</p>

        <.simple_form for={@form} id="message-form" phx-change="validate" phx-submit="save">
          <.input field={@form[:name]} type="text" label="Your Name" placeholder="Your Name" />
          <.input
            field={@form[:content]}
            type="textarea"
            label="Your Message"
            placeholder="Your Message"
          />
          <:actions>
            <.button phx-disable-with="Sending...">Send Message</.button>
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
  def handle_event("validate", %{"message" => message_params}, socket) do
    changeset = Messages.change_message(socket.assigns.message, message_params)
    {:noreply, assign(socket, form: to_form(changeset, action: :validate))}
  end

  def handle_event("save", %{"message" => message_params}, socket) do
    save_message(socket, message_params)
  end

  defp init_message(socket) do
    message = %Message{}

    socket
    |> assign(:message, message)
    |> assign(:form, message |> Messages.change_message() |> to_form())
  end

  defp save_message(socket, message_params) do
    case Messages.create_message(message_params) do
      {:ok, message} ->
        Task.start(fn -> send_telegram_message(message) end)

        {:noreply,
         socket
         |> put_flash(:info, "Message sent successfully")
         |> init_message()}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, form: to_form(changeset))}
    end
  end

  defp send_telegram_message(message) do
    Telegex.send_message(
      Application.get_env(:devshops_et, :admin_chat_id),
      """
      <b>New Message</b>

      <b>Name</b>
      #{message.name}

      <b>Content</b>
      #{message.content}
      """,
      parse_mode: "html"
    )
  end
end
