defmodule ExEchoBot.Router do
  use ExEchoBot.Web, :router

  # Add these two lines
  use FacebookMessenger.Phoenix.Router
  facebook_routes "/api/webhook", ExEchoBot.WebHookController
end
