defmodule FlightBooking.Users.AgentTest do
  alias FlightBooking.Users.Agent, as: UserAgent

  use ExUnit.Case

  import FlightBooking.Factory

  describe "save/1" do
    test "When the user is valid return :ok" do
      user = build(:user)
      UserAgent.start_link(%{})

      assert UserAgent.save(user) == :ok
    end
  end
end
