defmodule Ex17ls.Repo do
  use Ecto.Repo,
    otp_app: :ex17ls,
    adapter: Ecto.Adapters.Postgres
end
