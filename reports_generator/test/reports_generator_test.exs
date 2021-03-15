defmodule ReportsGeneratorTest do
  use ExUnit.Case

  @test_file "report_test.csv"
  @test_file_list ["report_1.csv", "report_2.csv", "report_3.csv"]

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
      res =
        @test_file
        |> ReportsGenerator.build()
        |> ReportsGenerator.fetch_higher_cost("foods")

      assert res == {:ok, {"esfirra", 3}}
    end

    test "Get the higher cost users" do
      res =
        @test_file
        |> ReportsGenerator.build()
        |> ReportsGenerator.fetch_higher_cost("users")

      assert res == {:ok, {"5", 49}}
    end

    test "When an invalid option" do
      res =
        @test_file
        |> ReportsGenerator.build()
        |> ReportsGenerator.fetch_higher_cost("beverages")

      assert res == {:error, "Invalid Option!"}
    end
  end

  describe "report_from_many/1" do
    test "When file list is provides" do
      res =
        @test_file_list
        |> ReportsGenerator.report_from_many()

      assert res == %{
               "foods" => %{
                 "açaí" => 37742,
                 "churrasco" => 37650,
                 "esfirra" => 37462,
                 "hambúrguer" => 37577,
                 "pastel" => 37392,
                 "pizza" => 37365,
                 "prato_feito" => 37519,
                 "sushi" => 37293
               },
               "users" => %{
                 "1" => 278_849,
                 "10" => 268_317,
                 "11" => 268_877,
                 "12" => 276_306,
                 "13" => 282_953,
                 "14" => 277_084,
                 "15" => 280_105,
                 "16" => 271_831,
                 "17" => 272_883,
                 "18" => 271_421,
                 "19" => 277_720,
                 "2" => 271_031,
                 "20" => 273_446,
                 "21" => 275_026,
                 "22" => 278_025,
                 "23" => 276_523,
                 "24" => 274_481,
                 "25" => 274_512,
                 "26" => 274_199,
                 "27" => 278_001,
                 "28" => 274_256,
                 "29" => 273_030,
                 "3" => 272_250,
                 "30" => 275_978,
                 "4" => 277_054,
                 "5" => 270_926,
                 "6" => 272_053,
                 "7" => 273_112,
                 "8" => 275_161,
                 "9" => 274_003
               }
             }
    end

    test "When file not provided" do
      res = ReportsGenerator.report_from_many("")

      assert res == {:error, "Please provide a list of strings"}
    end
  end
end
