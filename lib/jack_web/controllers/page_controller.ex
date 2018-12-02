defmodule JackWeb.PageController do
  use JackWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
