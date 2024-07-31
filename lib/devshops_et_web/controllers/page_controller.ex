defmodule DevshopsEtWeb.PageController do
  alias DevshopsEt.Companies
  use DevshopsEtWeb, :controller

  def home(conn, _params) do
    render(conn, :home, companies: Companies.list_companies())
  end
end
