defmodule ListFilterTest do
  use ExUnit.Case
  doctest ListFilter

  describe "Test Even Numbers List Filter" do
    test "When empty list" do
      res = ListFilter.call([])
      assert res == 0
    end

    test "When a given list" do
      res = ListFilter.call(["1", "3", "6", "43", "banana", "6", "abc"])
      assert res == 3
    end
  end
end
