defmodule FlightBooking.Bookings.CreateOrUpdate do
  alias FlightBooking.Bookings
  alias Bookings.Agent, as: BookingAgent
  alias Bookings.Booking

  def call(%{
        id: id,
        complete_date: complete_date,
        local_origin: local_origin,
        local_destination: local_destination,
        user_id: user_id
      }) do
    (id || UUID.uuid4())
    |> Booking.build((complete_date || NaiveDateTime.local_now()), local_origin, local_destination, user_id)
    |> save_booking()
  end

  defp save_booking({:ok, %Booking{} = booking}) do
    BookingAgent.save(booking)

    {:ok, "Booking created or updated successfully"}
  end

  defp save_booking({:error, _reason} = error), do: error
end
