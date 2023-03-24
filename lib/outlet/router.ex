defmodule Outlet.Router do
  use Plug.Router
  use Plug.ErrorHandler
  use Plug.Debugger

  alias Outlet.Plug.VerifyRequest
  alias Outlet.Accounts

  plug(:match)

  plug(Plug.Parsers,
    parsers: [:urlencoded, :multipart, :json],
    json_decoder: {Jason, :decode!, [[keys: :strings]]}
  )

  plug(VerifyRequest, fields: ["content", "mimetype"], paths: ["/upload"])
  plug(Plug.RequestId)
  plug(Plug.Logger)
  plug(:dispatch)

  get "/ping" do
    send_resp(conn, 200, "pong")
  end

  get "/upload" do
    send_resp(conn, 201, "Uploaded")
  end

  post "/user" do
    case conn.body_params do
      %{"name" => _name, "age" => _age} = user ->
        json =
          user
          |> Accounts.create_user()
          |> Accounts.User.to_json()

        conn
        |> put_resp_content_type("application/json")
        |> send_resp(200, json)

      _ ->
        conn
        |> send_resp(422, "Unable To Create User")
    end
  end

  get "/user/:id" do
    user = id |> Accounts.get_user()

    case user do
      nil ->
        conn |> send_resp(400, "User Not Found")

      _user ->
        json = Accounts.User.to_json(user)

        conn
        |> put_resp_content_type("application/json")
        |> send_resp(201, json)
    end
  end

  match _ do
    send_resp(conn, 404, "Not Found")
  end

  @doc """
  Callback function that `Plug.ErrorHandler` will call when an error occurs
  """
  def handle_errors(conn, %{kind: _kind, reason: _reason, stack: _stack} = _params) do
    send_resp(conn, conn.status, "Internal Server Error")
  end
end
