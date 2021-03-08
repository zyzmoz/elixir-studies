defmodule SumListTest do
  use ExUnit.Case

  describe "call/1" do
    test "returns the list sum" do
      list = [1,2,3]
      res = SumList.call(list)
      exp_res = 6

      assert res == exp_res
    end
  end
end
