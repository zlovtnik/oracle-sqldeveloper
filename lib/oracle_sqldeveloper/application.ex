defmodule OracleSqldeveloper.Application do
  use Application

  def start(_type, _args) do
    children = [
      OracleSqldeveloper.Repo,
      {Phoenix.PubSub, name: OracleSqldeveloper.PubSub},
      OracleSqldeveloperWeb.Endpoint
    ]

    opts = [strategy: :one_for_one, name: OracleSqldeveloper.Supervisor]
    Supervisor.start_link(children, opts)
  end

  def config_change(changed, _new, removed) do
    OracleSqldeveloperWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
