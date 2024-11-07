defmodule MealTrackerWeb.WelcomeCtrl do
  use MealTrackerWeb, :controller

  def index(conn, _params) do
    conn
    |> put_status(:ok)
    |> text("Hello :)")
  end
end
