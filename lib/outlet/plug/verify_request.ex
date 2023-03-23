defmodule Outlet.Plug.VerifyRequest do
  defmodule IncompleteRequestError do
    defexception message: "", plug_status: 400
  end

  def init(opts), do: opts

  def call(%Plug.Conn{request_path: path} = conn, opts) do
    if path in opts[:paths] do
      verify_request!(conn.params, opts[:fields])
    end

    conn
  end

  defp verify_request!(params, fields) do
    verified =
      params
      |> Map.keys()
      |> contains_fields?(fields)

    unless verified,
      do: raise(IncompleteRequestError, message: "Request is missing required fields")
  end

  defp contains_fields?(keys, fields) do
    Enum.all?(fields, &(&1 in keys))
  end
end
