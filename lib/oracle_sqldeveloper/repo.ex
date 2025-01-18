defmodule OracleSqldeveloper.Repo do
  use Ecto.Repo,
    otp_app: :oracle_sqldeveloper,
    adapter: Ecto.Adapters.Oracle

  def init(_, opts) do
    {:ok, Keyword.put(opts, :url, System.get_env("DATABASE_URL"))}
  end
end
