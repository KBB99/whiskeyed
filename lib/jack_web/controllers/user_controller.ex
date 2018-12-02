defmodule JackWeb.UserController do
  use JackWeb, :controller

  alias Jack.Instances
  alias Jack.Instances.User

  action_fallback JackWeb.FallbackController

  def index(conn, _params) do
    users = Instances.list_users()
    render(conn, "index.json", users: users)
  end

  def create(conn, %{"user" => user_params}) do
    count = length(Instances.list_users)
    with {:ok, %User{} = user} <- Instances.create_user(user_params) do
      |> put_status(:created)
      |> put_resp_header("location", Routes.user_path(conn, :show, user))
      |> render("show.json", user: user)
    end
  end

  def show(conn, %{"id" => id}) do
    user = Instances.get_user!(id)
    render(conn, "show.json", user: user)
  end

  def update(conn, %{"id" => id, "user" => user_params}) do
    user = Instances.get_user!(id)

    with {:ok, %User{} = user} <- Instances.update_user(user, user_params) do
      render(conn, "show.json", user: user)
    end
  end

  def delete(conn, %{"id" => id}) do
    user = Instances.get_user!(id)

    with {:ok, %User{}} <- Instances.delete_user(user) do
      send_resp(conn, :no_content, "")
    end
  end
end
