defmodule Exlivery.Orders.OrderTest do
  use ExUnit.Case

  alias Exlivery.Orders.Order

  import Exlivery.Factory

  describe "build/2" do
    test "Valid Order" do
      user = build(:user)

      items = [
        build(:item),
        build(:item, description: "Chicken Pizza", unity_price: Decimal.new("19.99"))
      ]

      res = Order.build(user, items)

      assert res == {:ok, build(:order)}
    end

    test "When invalid Order" do
      user = build(:user)

      items = []

      res = Order.build(user, items)

      assert res == {:error, "Invalid parameters"}
    end
  end
end
