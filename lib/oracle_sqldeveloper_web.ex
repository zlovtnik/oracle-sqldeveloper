defmodule OracleSqldeveloperWeb do
  use Phoenix.Endpoint, otp_app: :oracle_sqldeveloper

  socket "/socket", OracleSqldeveloperWeb.UserSocket,
    websocket: true,
    longpoll: false

  plug Plug.Static,
    at: "/",
    from: :oracle_sqldeveloper,
    gzip: false,
    only: ~w(css fonts images js favicon.ico robots.txt)

  plug Plug.RequestId
  plug Plug.Telemetry, event_prefix: [:phoenix, :endpoint]

  plug Plug.Parsers,
    parsers: [:urlencoded, :multipart, :json],
    pass: ["*/*"],
    json_decoder: Phoenix.json_library()

  plug Plug.MethodOverride
  plug Plug.Head
  plug Plug.Session, store: :cookie, key: "_oracle_sqldeveloper_key", signing_salt: "change_me"

  plug OracleSqldeveloperWeb.Router

  @impl true
  def init(_key, config) do
    if config[:load_from_system_env] do
      port = System.get_env("PORT") || raise "expected the PORT environment variable to be set"
      {:ok, Keyword.put(config, :http, [:inet6, port: port])}
    else
      {:ok, config}
    end
  end

  @impl true
  def call(conn, opts) do
    super(conn, opts)
  end
end
