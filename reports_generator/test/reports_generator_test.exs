defmodule ReportsGeneratorTest do
  use ExUnit.Case

  @test_file "report_test.csv"

  describe "build/1" do
    test "build list" do
      res =
        @test_file
        |> ReportsGenerator.build()

      assert res == %{
               "foods" => %{
                 "açaí" => 1,
                 "churrasco" => 2,
                 "esfirra" => 3,
                 "hambúrguer" => 2,
                 "pastel" => 0,
                 "pizza" => 2,
                 "prato_feito" => 0,
                 "sushi" => 0
               },
               "users" => %{
                 "1" => 48,
                 "10" => 36,
                 "11" => 0,
                 "12" => 0,
                 "13" => 0,
                 "14" => 0,
                 "15" => 0,
                 "16" => 0,
                 "17" => 0,
                 "18" => 0,
                 "19" => 0,
                 "2" => 45,
                 "20" => 0,
                 "21" => 0,
                 "22" => 0,
                 "23" => 0,
                 "24" => 0,
                 "25" => 0,
                 "26" => 0,
                 "27" => 0,
                 "28" => 0,
                 "29" => 0,
                 "3" => 31,
                 "30" => 0,
                 "4" => 42,
                 "5" => 49,
                 "6" => 18,
                 "7" => 27,
                 "8" => 25,
                 "9" => 24
               }
             }
    end
  end

  describe "fetch_higher_cost/2" do
    test "Get the higher cost food" do
      res = @test_file
      |> ReportsGenerator.build()
      |> ReportsGenerator.fetch_higher_cost("foods")

      assert res == {:ok, {"esfirra", 3}}
    end

    test "Get the higher cost users" do
      res = @test_file
      |> ReportsGenerator.build()
      |> ReportsGenerator.fetch_higher_cost("users")

      assert res == {:ok, {"5", 49}}
    end

    test "When an invalid option" do
      res = @test_file
      |> ReportsGenerator.build()
      |> ReportsGenerator.fetch_higher_cost("beverages")

      assert res == {:error, "Invalid Option!"}
    end

  end
end
