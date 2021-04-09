defmodule Exlivery.Orders.CreateOrUpdateTest do
  use ExUnit.Case

  import Exlivery.Factory

  alias Exlivery.Orders.Agent, as: OrderAgent
  alias Exlivery.Orders.CreateOrUpdate
  alias Exlivery.Users.Agent, as: UserAgent

  describe "call/1" do
    setup do
      UserAgent.start_link(%{})
      OrderAgent.start_link(%{})
      cpf = "12345678900"
      user = build(:user, cpf: cpf)

      UserAgent.save(user)

      item1 = %{
        category: :pizza,
        description: "Pepperoni",
        unity_price: "35.99",
        quantity: 1
      }

      item2 = %{
        category: :pizza,
        description: "Brocolli",
        unity_price: "32.99",
        quantity: 1
      }

      {:ok, user_cpf: cpf, item1: item1, item2: item2}
    end

    test "When all parameters are valid", %{user_cpf: cpf, item1: item1, item2: item2} do
      params = %{user_cpf: cpf, items: [item1, item2]}
      assert {:ok, _order} = CreateOrUpdate.call(params)
    end

    test "When invalid user", %{item1: item1, item2: item2} do
      params = %{user_cpf: "0000", items: [item1, item2]}
      res = CreateOrUpdate.call(params)

      assert res == {:error, "User not found"}
    end

    test "When invalid product quantity", %{user_cpf: cpf, item1: item1, item2: item2} do
      params = %{user_cpf: cpf, items: [%{item1 | quantity: 0}, item2]}
      res = CreateOrUpdate.call(params)

      assert res == {:error, "Invalid Items"}
    end

    test "When invalid items", %{user_cpf: cpf} do
      params = %{user_cpf: cpf, items: []}
      res = CreateOrUpdate.call(params)

      assert res == {:error, "Invalid parameters"}
    end
  end
end
