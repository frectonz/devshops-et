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
    plug :bump_metric
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  pipeline :admins_only do
    plug :admin_basic_auth
  end

  scope "/", DevshopsEtWeb do
    pipe_through :browser

    live "/", HomeLive.Index
    live "/register", SubmissionLive.Register
  end

  # Other scopes may use custom stacks.
  # scope "/api", DevshopsEtWeb do
  #   pipe_through :api
  # end

  scope "/dev" do
    pipe_through [:browser, :admins_only]

    live "/metrics", DevshopsEtWeb.MetricLive.Index, :index
    live "/submissions", DevshopsEtWeb.SubmissionLive.Index, :index
    live_dashboard "/dashboard", metrics: DevshopsEtWeb.Telemetry
    forward "/mailbox", Plug.Swoosh.MailboxPreview
  end

  defp admin_basic_auth(conn, _opts) do
    username = System.get_env("AUTH_USERNAME") || "dev"
    password = System.get_env("AUTH_PASSWORD") || "dev"
    Plug.BasicAuth.basic_auth(conn, username: username, password: password)
  end

  defp bump_metric(conn, _opts) do
    register_before_send(conn, fn conn ->
      if conn.status == 200 do
        path = "/" <> Enum.join(conn.path_info, "/")
        DevshopsEt.Metrics.bump(path)
      end

      conn
    end)
  end
end
