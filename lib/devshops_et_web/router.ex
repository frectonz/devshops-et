defmodule DevshopsEtWeb.Router do
  use DevshopsEtWeb, :router
  import Phoenix.LiveDashboard.Router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_live_flash
    plug :put_root_layout, html: {DevshopsEtWeb.Layouts, :root}
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  pipeline :admins_only do
    plug :admin_basic_auth
  end

  scope "/", DevshopsEtWeb do
    pipe_through :browser

    get "/", PageController, :home
  end

  # Other scopes may use custom stacks.
  # scope "/api", DevshopsEtWeb do
  #   pipe_through :api
  # end

  scope "/dev" do
    pipe_through [:browser, :admins_only]

    live_dashboard "/dashboard", metrics: DevshopsEtWeb.Telemetry
    forward "/mailbox", Plug.Swoosh.MailboxPreview
  end

  defp admin_basic_auth(conn, _opts) do
    username = System.get_env("AUTH_USERNAME") || "dev"
    password = System.get_env("AUTH_PASSWORD") || "dev"
    Plug.BasicAuth.basic_auth(conn, username: username, password: password)
  end
end
