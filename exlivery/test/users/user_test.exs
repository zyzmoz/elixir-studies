defmodule Exlivery.Users.UserTest do
  use ExUnit.Case

  alias Exlivery.Users.User

  import Exlivery.Factory

  describe "build/5" do
    test "When user informed" do
      res = User.build("Test", "mail@email.com", "123456", 29, "Granville ave")

      assert res == {:ok, build(:user)}
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
