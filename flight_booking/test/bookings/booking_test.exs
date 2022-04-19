defmodule FlightBooking.Bookings.BookingTest do
  alias FlightBooking.Bookings.Booking

  use ExUnit.Case

  describe "build/5" do
    test "when all params are valid, returns the booking" do
      local_time = NaiveDateTime.local_now()
      response = Booking.build("1", local_time, "Brazil", "Canada", "1")

      expected_response =
        {:ok,
         %FlightBooking.Bookings.Booking{
           complete_date: local_time,
           id: "1",
           local_destination: "Canada",
           local_origin: "Brazil",
           user_id: "1"
         }}

      assert response == expected_response
    end

    test "when any param is invalid, returns an error" do
      local_time = NaiveDateTime.local_now()
      response = Booking.build(nil, local_time, "Brazil", "Canada", "1")

      expected_response = {:error, "Invalid Parameters"}

      assert response == expected_response
    end
  end
end
