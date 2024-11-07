defmodule MealTrackerWeb.MealsCtrlJSON do
  alias MealTracker.Meal

  def create(%{meal: meal}) do
    %{data: data(meal)}
  end

  def show(%{meal: %Meal{} = meal}) do
    data(meal)
  end

  def show_all(%{meals: meals}) do
    Enum.map(meals, fn %Meal{} = meal ->
      data(meal)
    end)
  end

  defp data(%Meal{} = meal) do
    %{id: meal.id, data: meal.data, descricao: meal.descricao, calorias: meal.calorias}
  end
end
