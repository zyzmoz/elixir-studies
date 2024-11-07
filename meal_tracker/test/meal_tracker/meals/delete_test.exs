defmodule MealTracker.Meals.DeleteTest do
alias Ecto.UUID
  use MealTracker.DataCase, async: true

  alias MealTracker.Meals.{Create, Delete}
  alias MealTracker.{Error, Meal}

  import MealTracker.Factory

  describe "call/1" do
    test "when id is valid and exists, delete meal" do
      params = build(:meal_params)

      {:ok, %Meal{id: id}} = Create.call(params)

      res = Delete.call(id)

      assert {:ok, %Meal{}} = res
    end

    test "when id is valid but doesn't exist, return error" do
      uuid = UUID.generate()

      res = Delete.call(uuid)

      assert {:error, %Error{}} = res
    end

    test "when id is invalid, return error" do
      id = 123_456

      res = Delete.call(id)

      assert {:error, %Error{}} = res
    end
  end
end
