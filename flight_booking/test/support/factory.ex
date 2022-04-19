defmodule FlightBooking.Factory do
  alias FlightBooking.Users.User
  alias FlightBooking.Bookings.Booking

  use ExMachina

  def user_factory() do
    %User{
      id: "1",
      name: "Test",
      cpf: "123456",
      email: "test@email.com"
    }
  end

  def booking_factory() do
    %Booking{
      id: "1",
      complete_date: ~N[2000-01-01 23:00:07],
      local_origin: "Brazil",
      local_destination: "Canada",
      user_id: "1"
    }
  end
end
