defmodule Exlivery.Users.UserTest do
  use ExUnit.Case

  alias Exlivery.Users.User

  describe "build/5" do
    test "When user informed" do
      res = User.build("Daniel", "and@email.com", "123456", 18, "Granville Ave, 189")

      assert res == {:ok, %Exlivery.Users.User{address: "Granville Ave, 189", age: 18, cpf: "123456", email: "and@email.com", name: "Daniel"}}
    end

    test "When user not informed" do
      res = User.build("", "", "", 0, "")

      assert res == {:error, "Invalid parameters"}
    end

    test "When user is a minor" do
      res = User.build("Daniel", "my@email.com", "12346", 17, "W. Pender Street, 789")

      assert res == {:error, "Invalid parameters"}
    end
  end
end
