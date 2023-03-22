defmodule Outlet.Router do
  use Plug.Router

  plug(Plug.Logger)
  plug(:match)
  plug(:dispatch)

  get "/" do
    send_resp(conn, 200, "Hello World!")
  end

  get "/ping" do
    send_resp(conn, 200, "pong")
  end

  match _ do
    send_resp(conn, 404, "Not Found")
  end
end
