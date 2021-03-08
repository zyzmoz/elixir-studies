defmodule ListLengthTest do
  use ExUnit.Case

  describe "verify the length of a given list" do
    test "Empty list" do
      res = ListLength.call([])
      assert res == 0
    end

    test "List containing 3 positions" do
      res = ListLength.call([1,2,3])

      assert res == 3
    end
  end
end
