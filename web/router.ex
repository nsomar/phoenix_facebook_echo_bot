defmodule ExEchoBot.Router do
  use ExEchoBot.Web, :router

  # Add these two lines
  use FacebookMessenger.Router
  facebook_routes "/api/webhook", ExEchoBot.WebHookController
end
