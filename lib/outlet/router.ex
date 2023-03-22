defmodule Outlet.Router do
  use Plug.Router

  alias Outlet.Plug.VerifyRequest

  plug(Plug.Parsers, parsers: [:urlencoded, :multipart])
  plug(VerifyRequest, fields: ["content", "mimetype"], paths: ["/upload"])
  plug(Plug.Logger)
  plug(:match)
  plug(:dispatch)

  get "/" do
    send_resp(conn, 200, "Hello World!")
  end

  get "/ping" do
    send_resp(conn, 200, "pong")
  end

  get "/upload" do
    send_resp(conn, 201, "Uploaded")
  end

  match _ do
    send_resp(conn, 404, "Not Found")
  end
end
