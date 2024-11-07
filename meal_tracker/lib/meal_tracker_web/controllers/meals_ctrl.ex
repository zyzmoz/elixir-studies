defmodule MealTrackerWeb.MealsCtrl do
  use MealTrackerWeb, :controller

  alias MealTrackerWeb.FallbackCtrl
  alias MealTracker.Meal

  action_fallback FallbackCtrl

  def create(conn, params) do
    with {:ok, %Meal{} = meal} <- MealTracker.create_meal(params) do
      conn
      |> put_status(:created)
      |> render(:create, meal: meal)
    end
  end

  def show(conn, %{"id" => id}) do
    with {:ok, %Meal{} = meal} <- MealTracker.get_meal_by_id(id) do
      conn
      |> put_status(:ok)
      |> render(:show, meal: meal)
    end
  end

  def update(conn, params) do
    with {:ok, %{} = meal} <- MealTracker.update_meal(params) do
      conn
      |> put_status(:ok)
      |> render(:show, meal: meal)
    end
  end

  def index(conn, _) do
    conn
    |> put_status(:ok)
    |> render(:show_all, meals: MealTracker.get_meals())
  end

  def delete(conn, %{"id" => id}) do
    with {:ok, _} <- MealTracker.delete_meal(id) do
      conn
      |> put_status(:no_content)
      |> text("")
    end
  end
end
