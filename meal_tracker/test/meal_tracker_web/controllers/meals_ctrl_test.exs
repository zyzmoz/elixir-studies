defmodule MealTrackerWeb.MealsCtrlTest do
  use MealTrackerWeb.ConnCase, async: true

  alias Ecto.UUID
  alias MealTracker.Meals.Create
  alias MealTracker.Meal

  import MealTracker.Factory

  describe "create/2" do
    test "when all params valid, creates meal", %{conn: conn} do
      params = %{
        "descricao" => "Food",
        "calorias" => 3_000
      }

      res =
        conn
        |> post(~p"/api/meals", params)
        |> json_response(:created)

      assert %{
               "data" => %{
                 "calorias" => 3000,
                 "data" => _,
                 "descricao" => "Food",
                 "id" => _
               }
             } = res
    end

    test "when params invalid, return error", %{conn: conn} do
      res =
        conn
        |> post(~p"/api/meals", %{})
        |> json_response(:bad_request)

      assert %{
               "message" => %{"calorias" => ["can't be blank"], "descricao" => ["can't be blank"]}
             } = res
    end
  end

  describe "show/2" do
    test "when id is valid, return meal", %{conn: conn} do
      params = build(:meal_params)
      {:ok, %Meal{id: id}} = Create.call(params)

      res =
        conn
        |> get(~p"/api/meals/#{id}")
        |> json_response(:ok)

      assert %{
               "calorias" => 310,
               "data" => _,
               "descricao" => "Food",
               "id" => _
             } = res
    end

    test "when id is valid but doesn't exist, return error", %{conn: conn} do
      id = UUID.generate()

      res =
        conn
        |> get(~p"/api/meals/#{id}")
        |> json_response(:not_found)

      assert %{"message" => "Meal not found"} = res
    end

    test "when id is invalid, return error", %{conn: conn} do
      res =
        conn
        |> get(~p"/api/meals/123456")
        |> json_response(:bad_request)

      assert %{"message" => "Invalid Meal id"} = res
    end
  end

  describe "index/2" do
    test "should return list", %{conn: conn} do
      res =
        conn
        |> get(~p"/api/meals")
        |> json_response(:ok)

      assert [] = res
    end
  end

  describe "update/2" do
    test "when all params valid, update meal", %{conn: conn} do
      params = build(:meal_params)
      {:ok, %Meal{id: id}} = Create.call(params)

      new_params = %{
        "id" => id,
        "descricao" => "Food 2",
        "calorias" => 3_000
      }

      res =
        conn
        |> put(~p"/api/meals/#{id}", new_params)
        |> json_response(:ok)

      assert %{
               "data" => _,
               "calorias" => 3000,
               "descricao" => "Food 2",
               "id" => ^id
             } = res
    end

    test "when id is valid but doesn't exist, return error", %{conn: conn} do
      id = UUID.generate()

      new_params = %{
        "id" => id,
        "descricao" => "Food 2",
        "calorias" => 3_000
      }

      res =
        conn
        |> put(~p"/api/meals/#{id}", new_params)
        |> json_response(:not_found)

      assert %{"message" => "Meal not found"} = res
    end

    test "when id is invalid, return error", %{conn: conn} do
      id = 123_456

      res =
        conn
        |> put(~p"/api/meals/#{id}", %{"id" => id})
        |> json_response(:bad_request)

      assert %{"message" => "Invalid 123456 id"} = res
    end
  end

  describe "delete/2" do
    test "when id is valid, delete meal", %{conn: conn} do
      params = build(:meal_params)
      {:ok, %Meal{id: id}} = Create.call(params)

      res =
        conn
        |> delete(~p"/api/meals/#{id}")
        |> text_response(:no_content)

      assert "" = res
    end

    test "when id is valid but doesn't exist, return error", %{conn: conn} do
      id = UUID.generate()

      res =
        conn
        |> delete(~p"/api/meals/#{id}")
        |> json_response(:not_found)

      assert %{"message" => "Meal not found"} = res
    end

    test "when id is invalid, return error", %{conn: conn} do
      res =
        conn
        |> delete(~p"/api/meals/123456")
        |> json_response(:bad_request)

      assert %{"message" => "Invalid Meal id"} = res
    end
  end
end
