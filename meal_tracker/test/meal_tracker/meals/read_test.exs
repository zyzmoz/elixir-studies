defmodule MealTracker.Meals.ReadTest do
  alias Ecto.UUID
  use MealTracker.DataCase, async: true

  alias MealTracker.{Error, Meal}
  alias MealTracker.Meals.Read
  alias MealTracker.Meals.Create

  import MealTracker.Factory

  describe "call/0" do
    test "should return a List" do
      res = Read.call()

      assert [] = res
    end
  end

  describe "by_id/1" do
    test "when id is valid, return meal" do
      params = build(:meal_params)
      {:ok, %Meal{id: id} = meal} = Create.call(params)

      res = Read.by_id(id)

      assert {:ok, ^meal} = res
    end

    test "when id is valid but meal doesn't exist, return error" do
      uuid = UUID.generate()

      res = Read.by_id(uuid)

      assert {:error, %Error{}} = res
    end

    test "when id is invalid, return error" do
      uuid = 123_456

      res = Read.by_id(uuid)

      assert {:error, %Error{}} = res
    end
  end
end
