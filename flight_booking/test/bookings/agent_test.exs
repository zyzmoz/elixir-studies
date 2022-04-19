defmodule FlightBooking.Bookings.AgentTest do
  alias FlightBooking.Bookings.Agent, as: BookingAgent

  use ExUnit.Case

  import FlightBooking.Factory

  describe "save/1" do
    test "when the booking is valid" do
      booking = build(:booking)

      BookingAgent.start_link(%{})

      assert BookingAgent.save(booking) == :ok
    end
  end
end
