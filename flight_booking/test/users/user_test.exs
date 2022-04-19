defmodule FlightBooking.Users.UserTest do
  alias FlightBooking.Users.User

  use ExUnit.Case

  describe "build/4" do
    test "when all params are valid, returns the user" do
      response = User.build("1", "Daniel", "daniel@email.com", "20")

      expected_response =
        {:ok,
         %FlightBooking.Users.User{cpf: "20", email: "daniel@email.com", id: "1", name: "Daniel"}}

      assert response == expected_response
    end

    test "when any param is invalid, returns an error" do
      response = User.build(nil, "Daniel", "daniel@email.com", "20")

      expected_response = {:error, "Invalid Parameters"}

      assert response == expected_response
    end
  end
end
