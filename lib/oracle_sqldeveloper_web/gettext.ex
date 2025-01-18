defmodule OracleSqldeveloperWeb.Gettext do
  use Gettext.Backend, otp_app: :oracle_sqldeveloper
  use Gettext, backend: OracleSqldeveloperWeb.Gettext
end
