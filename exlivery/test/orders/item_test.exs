defmodule Exlivery.Orders.ItemTest do
  use ExUnit.Case

  alias Exlivery.Orders.Item

  import Exlivery.Factory

  describe "build/4" do
    test "Valid item" do
      res = Item.build("Pepperoni Pizza", :pizza, "28.36", 1)

      assert res == {:ok, build(:item)}
    end

    test "When invalid category" do
      res = Item.build("Pepperoni Pizza", :russia, "28.36", 1)

      assert res == {:error, "Invalid parameters!"}
    end

    test "When invalid price" do
      res = Item.build("Pepperoni Pizza", :pizza, "Price", 1)

      assert res == {:error, "Invalid price!"}
    end

    test "When invalid quantity" do
      res = Item.build("Pepperoni Pizza", :pizza, "28.36", 0)

      assert res == {:error, "Invalid parameters!"}
    end
  end
end
