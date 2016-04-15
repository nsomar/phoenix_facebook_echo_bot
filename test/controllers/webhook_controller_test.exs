# Logger.disable(self)

defmodule ExEchoBot.WebHookControllerTest do
  use ExEchoBot.ConnCase

  test "GET /api/webhook without query" do
    conn = get conn(), "/api/webhook"
    assert conn.status == 500
    assert conn.resp_body == "{\"error\":{\"path\":\"/api/webhook\",\"params\":{}}}"
  end

  test "GET /api/webhook with query" do

    conn = get conn(), "/api/webhook?hub.mode=subscribe&hub.challenge=914942744&hub.verify_token=123123"
    assert conn.status == 200
    assert conn.resp_body == "914942744"
  end

  test "it posts back the message" do
    params =
    %{"entry" =>
    [
      %{"id" => 1055439761215256, "messaging" =>
        [%{"message" =>
          %{"mid" => "mid.1460729419702:c1411ecc316e2a0f41", "seq" => 2, "text" => "Hello"},
          "recipient" => %{"id" => 1055439761215256},
          "sender" => %{"id" => 985712624830702}, "timestamp" => 1460729419951}
        ],
      "time" => 1460731692026}
    ], "object" => "page"}

    conn = post conn(), "/api/webhook", params
    assert_received %{body: "{\"recipient\":{\"id\":985712624830702},\"message\":{\"text\":\"Hello\"}}", url: "https://graph.facebook.com/v2.6/me/messages?access_token=PAGE_TOKEN"}
  end

end
