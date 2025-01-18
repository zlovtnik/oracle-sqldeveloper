defmodule OracleSqldeveloper.Repo do
  use Ecto.Repo,
    otp_app: :oracle_sqldeveloper,
    adapter: Ecto.Adapters.SQLite3
end
