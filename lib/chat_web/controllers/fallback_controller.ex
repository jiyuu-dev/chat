defmodule ChatWeb.FallbackController do
  use ChatWeb, :controller

  def call(conn, {:error, status}) do
    conn
    |> put_status(status)
    |> json(%{message: "An error Occurred"})
  end
end
