defmodule MealTracker.Factory  do
  use ExMachina

  def meal_params_factory do
    %{
      descricao: "Food",
      calorias: 310
    }
  end
end
