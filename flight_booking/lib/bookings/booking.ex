defmodule FlightBooking.Bookings.Booking do
  @keys [:id, :complete_date, :local_origin, :local_destination, :user_id]
  @enforce_keys @keys

  defstruct @keys

  def build(id, complete_date, local_origin, local_destination, user_id) when is_bitstring(id) and is_bitstring(user_id) do
    {
      :ok,
      %__MODULE__{
        id: id,
        complete_date: complete_date,
        local_origin: local_origin,
        local_destination: local_destination,
        user_id: user_id
      }
    }
  end

  def build(_id, _complete_date, _local_origin, _local_destination, _user_id),
    do: {:error, "Invalid Parameters"}
end
