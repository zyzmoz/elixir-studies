defmodule FlightBooking.Bookings.Report do
  alias FlightBooking.Bookings.Agent, as: BookingAgent
  alias FlightBooking.Bookings.Booking

  def create(filename \\ "report.csv") do
    booking_list = build_booking_list()

    File.write(filename, booking_list)
  end

  defp build_booking_list() do
    {:ok, booking_list} = BookingAgent.get_all_bookings()
    booking_list
    |> Map.values()
    |> Enum.map(fn booking -> booking_string(booking) end)
  end

  defp booking_string(%Booking{
    id: id,
    complete_date: complete_date,
    local_origin: local_origin,
    local_destination: local_destination,
    user_id: user_id
  }) do
    "#{id},#{complete_date},#{local_origin},#{local_destination},#{user_id}\n"
  end

end
