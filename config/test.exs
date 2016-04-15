use Mix.Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :ex_echo_bot, ExEchoBot.Endpoint,
  http: [port: 4001],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn

config :ex_echo_bot,
  verify_token: "123123",
  request_manager: RequestManager.Mock

config :facebook_messenger,
  request_manager: FacebookMessenger.RequestManager.Mock

config :facebook_messenger,
  facebook_page_token: "PAGE_TOKEN",
  challange_verification_token: "123123"
