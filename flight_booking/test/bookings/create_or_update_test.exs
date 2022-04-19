defmodule FlightBooking.Bookings.CreateOrUpdateTest do
  alias FlightBooking.Bookings.Booking
  alias FlightBooking.Bookings.CreateOrUpdate, as: CreateOrUpdateBooking
  alias FlightBooking.Bookings.Agent, as: BookingAgent

  use ExUnit.Case

  import FlightBooking.Factory

  describe "call/1" do
    setup do
      BookingAgent.start_link(%{})

      :ok
    end

    test "when booking created" do
      booking = build(:booking)

      response = CreateOrUpdateBooking.call(booking)

      assert response == {:ok, "Booking created or updated successfully"}
    end

    test "when invalid booking" do
      params = %{
        id: nil,
        complete_date: nil,
        local_origin: nil,
        local_destination: nil,
        user_id: nil
      }

      response = CreateOrUpdateBooking.call(params)

      assert response == {:error, "Invalid Parameters"}
    end
  end
end
