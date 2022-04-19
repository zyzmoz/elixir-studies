defmodule FlightBooking.Bookings.Agent do
  alias FlightBooking.Bookings.Booking

  use Agent

  def start_link(_initial_state) do
    Agent.start_link(fn -> %{} end, name: __MODULE__)
  end

  def save(%Booking{} = booking) do
    Agent.update(__MODULE__, &update_state(&1, booking))
  end

  def get_all_bookings() do
    Agent.get(__MODULE__, fn state -> {:ok, state} end)
  end

  defp update_state(state, %Booking{id: id} = booking) do
    Map.put(state, id, booking)
  end


end
