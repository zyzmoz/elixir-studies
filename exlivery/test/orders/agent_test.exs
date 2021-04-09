defmodule Exlivery.Orders.AgentTest do
  use ExUnit.Case

  alias Exlivery.Orders.Agent, as: OrderAgent
  import Exlivery.Factory

  describe "save/1" do
    test "saves the order" do
      order = build(:order)

      OrderAgent.start_link(%{})

      assert {:ok, _uuid} = OrderAgent.save(order)
    end
  end

  describe "get_order_by_id/1" do
    setup do
      OrderAgent.start_link(%{})
      order = build(:order)
      {:ok, uuid} = OrderAgent.save(order)

      {:ok, uuid: uuid}
    end

    test "When order exists", %{uuid: uuid} do

      assert {:ok, _order} = OrderAgent.get_order_by_id(uuid)

    end

    test "When order do not exists" do

      assert {:error, _order} = OrderAgent.get_order_by_id("123456")

    end
  end
end
