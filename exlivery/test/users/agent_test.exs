defmodule Exlivery.Users.AgentTest do
  use ExUnit.Case

  alias Exlivery.Users.Agent, as: UserAgent

  import Exlivery.Factory


  describe "save/1" do
    test "saves the user" do
      user = build(:user)
      UserAgent.start_link(%{})

      assert UserAgent.save(user) == :ok
    end
  end

  describe "get_by-cpf/1" do
    setup do
      UserAgent.start_link(%{})

      :ok
    end

    test "User found" do

      :user
      |> build(cpf: "123456")
      |> UserAgent.save()

      res = UserAgent.get_by_cpf("123456")

      assert res ==
               {:ok,
                %Exlivery.Users.User{
                  address: "Granville ave",
                  age: 29,
                  cpf: "123456",
                  email: "mail@email.com",
                  name: "Test"
                }}
    end

    test "User not found" do
      assert UserAgent.get_by_cpf("123456") == {:error, "User not found"}
    end
  end
end
