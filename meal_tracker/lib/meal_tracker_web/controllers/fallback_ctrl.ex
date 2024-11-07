defmodule MealTrackerWeb.FallbackCtrl do
  use MealTrackerWeb, :controller

  alias MealTrackerWeb.ErrorJSON
  alias MealTracker.Error

  def call(conn,  {:error, %Error{status: status, result: result}}) do
    conn
    |> put_status(status)
    |> put_view(ErrorJSON)
    |> render("400.json", result: result)
  end
end
