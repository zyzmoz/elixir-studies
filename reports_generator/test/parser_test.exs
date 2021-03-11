defmodule ReportsGenerator.ParserTest do
  use ExUnit.Case
  alias ReportsGenerator.Parser

  @test_file "report_test.csv"

  describe "parse_file/1" do
    test "Invalid File" do
      res =
        @test_file
        |> Parser.parse_file()
        |> Enum.map(& &1)

      assert res == [
               ["1", "pizza", 48],
               ["2", "açaí", 45],
               ["3", "hambúrguer", 31],
               ["4", "esfirra", 42],
               ["5", "hambúrguer", 49],
               ["6", "esfirra", 18],
               ["7", "pizza", 27],
               ["8", "esfirra", 25],
               ["9", "churrasco", 24],
               ["10", "churrasco", 36]
             ]
    end
  end
end
