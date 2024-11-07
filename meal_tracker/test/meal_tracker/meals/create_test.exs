defmodule MealTracker.Meals.CreateTest do
  use MealTracker.DataCase, async: true

  alias MealTracker.{Error, Meal}
  alias MealTracker.Meals.Create

  import MealTracker.Factory

  describe "call/1" do
    test "when all params are valid, returns meal" do
      params = build(:meal_params)

      res = Create.call(params)

      assert {:ok, %Meal{descricao: "Food", calorias: 310}} = res
    end

    test "when invalid params, returns error" do
      params = build(:meal_params, %{calorias: "abc"})

      res = Create.call(params)

      assert {:error, %Error{}} = res
    end
  end
end
