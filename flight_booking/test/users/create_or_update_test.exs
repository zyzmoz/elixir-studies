defmodule FlightBooking.Users.CreateOrUpdateTest do
  alias FlightBooking.Users.User
  alias FlightBooking.Users.CreateOrUpdate, as: CreateOrUpdateUser
  alias FlightBooking.Users.Agent, as: UserAgent

  use ExUnit.Case

  import FlightBooking.Factory

  describe "call/1" do
    setup do
      UserAgent.start_link(%{})

      :ok
    end

    test "when user created" do
      user = build(:user)

      response = CreateOrUpdateUser.call(user)
      assert response == {:ok, "User created or updated successfully"}
    end

    test "when invalid user" do
      params = %{id: 1, name: "Daniel", email: "daniel@email.com", cpf: "20"}

      response = CreateOrUpdateUser.call(params)

      assert response == {:error, "Invalid Parameters"}
    end
  end
end
