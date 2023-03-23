defmodule Outlet.Router do
  use Plug.Router
  use Plug.ErrorHandler
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

  @doc """
  Callback function that `Plug.ErrorHandler` will call when an error occurs
  """
  def handle_errors(conn, %{kind: kind, reason: reason, stack: stack}) do
    IO.inspect(kind, label: "Kind")
    IO.inspect(reason, label: "Reason")
    IO.inspect(stack, label: "Stack")
    send_resp(conn, conn.status, "Something went wrong")
  end
end
