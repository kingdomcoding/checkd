defmodule CheckdWeb.BadgeUser.AuthController do
  use CheckdWeb, :controller

  def sign_in(conn, _params) do
    {:ok, %{id: user_id}} = Checkd.UserManagement.create_user()

    conn
    |> put_session(:user_id, user_id)
    |> redirect(to: ~p"/")
  end

  def sign_out(conn, _params) do
    conn
    |> delete_session(:user_id)
    |> redirect(to: ~p"/")
  end
end
