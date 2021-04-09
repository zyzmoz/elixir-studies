defmodule Exlivery.Users.CreateOrUpdateTest do
  use ExUnit.Case

  alias Exlivery.Users.CreateOrUpdate
  alias Exlivery.Users.Agent, as: UserAgent

  describe "call/1" do
    setup do
      UserAgent.start_link(%{})

      :ok
    end

    test "When user created" do
      params = %{
        name: "Dev",
        cpf: "12345678900",
        email: "email@dev.com",
        age: 29,
        address: "Groove St"
      }

      res = CreateOrUpdate.call(params)
      assert res == {:ok, "User created or updated successfully"}
    end

    test "When invalid user" do
      params = %{
        name: "Dev",
        cpf: "12345678900",
        email: "email@dev.com",
        age: 16,
        address: "Groove St"
      }

      assert CreateOrUpdate.call(params) == {:error, "Invalid parameters"}
    end
  end
end
