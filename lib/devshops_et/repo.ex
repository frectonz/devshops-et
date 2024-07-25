defmodule DevshopsEt.Repo do
  use Ecto.Repo,
    otp_app: :devshops_et,
    adapter: Ecto.Adapters.Postgres
end
