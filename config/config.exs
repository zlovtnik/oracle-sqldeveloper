use Mix.Config

config :oracle_sqldeveloper, OracleSqldeveloper.Repo,
  database: "oracle_sqldeveloper.sqlite3",
  pool_size: 10

config :oracle_sqldeveloper, ecto_repos: [OracleSqldeveloper.Repo]
