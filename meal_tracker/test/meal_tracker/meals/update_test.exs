defmodule MealTracker.Meals.UpdateTest do
alias Ecto.UUID
  use MealTracker.DataCase, asunc: true

  alias MealTracker.Meals.{Create, Update}
  alias MealTracker.{Error, Meal}

  import MealTracker.Factory

  describe "call/1" do
    test "when id is valid, update meal" do
      params = build(:meal_params)

      {:ok, %Meal{id: id}} = Create.call(params)

      new_params = %{
        "id" => id,
        "calorias" => 30_000
      }

      res = Update.call(new_params)

      assert {:ok, %Meal{calorias: 30_000}} = res
    end

    test "when id is valid but doesn't exist, return error" do
      new_params = %{
        "id" => UUID.generate()
      }

      res = Update.call(new_params)

      assert {:error, %Error{}} = res
    end

    test "when id is not valid, return error" do
      new_params = %{
        "id" => 123_456
      }

      res = Update.call(new_params)

      assert {:error, %Error{}} = res
    end
  end
end
