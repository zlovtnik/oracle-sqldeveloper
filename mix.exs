defmodule OracleSqldeveloper.MixProject do
  use Mix.Project

  def project do
    [
      app: :oracle_sqldeveloper,
      version: "0.1.0",
      elixir: "~> 1.11",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  def application do
    [
      extra_applications: [:logger, :runtime_tools],
      mod: {OracleSqldeveloper.Application, []}
    ]
  end

  defp deps do
    [
      {:ecto_sql, "~> 3.6"},
      {:oracle_ecto, "~> 0.1.0"},
      {:phoenix, "~> 1.5.9"},
      {:phoenix_html, "~> 2.14"},
      {:phoenix_live_reload, "~> 1.2", only: :dev},
      {:phoenix_live_view, "~> 0.15.7"},
      {:floki, ">= 0.0.0", only: :test},
      {:telemetry_metrics, "~> 0.6"},
      {:telemetry_poller, "~> 0.5"},
      {:gettext, "~> 0.11"},
      {:jason, "~> 1.0"},
      {:plug_cowboy, "~> 2.0"}
    ]
  end
end
