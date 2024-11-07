defmodule MealTracker.MealTest do
  use MealTracker.DataCase, async: true

  import MealTracker.Factory

  alias Ecto.Changeset
  alias MealTracker.Meal

  describe "changeset/2" do
    test "when all params are valid, return valid changeset" do
      params = build(:meal_params)

      res = Meal.changeset(params)

      assert %Changeset{changes: %{descricao: "Food", calorias: 310}, valid?: true} = res
    end

    test "when updating changeset, return changeset with given changes" do
      params = build(:meal_params)

      upd_params = %{
        calorias: 2000
      }

      changeset = Meal.changeset(params)

      res = Meal.changeset(changeset, upd_params)

      assert %Changeset{changes: %{descricao: "Food", calorias: 2000}, valid?: true} = res
    end

    test "when error, return invalid changeset" do
      params = build(:meal_params, %{calorias: "abc"})

      res = Meal.changeset(params)

      assert %Changeset{valid?: false} = res
    end
  end
end
