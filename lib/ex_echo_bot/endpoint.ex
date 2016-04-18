defmodule ExEchoBot.Endpoint do
  use Phoenix.Endpoint, otp_app: :ex_echo_bot

  plug Plug.RequestId
  plug Plug.Logger

  plug Plug.Parsers,
    parsers: [:urlencoded, :multipart, :json],
    pass: ["*/*"],
    json_decoder: Poison

  plug Plug.MethodOverride
  plug Plug.Head

  plug ExEchoBot.Router
end
