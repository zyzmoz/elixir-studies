defmodule FlightBooking.Users.Agent do
  alias FlightBooking.Users.User

  use Agent

  def start_link(_initial_state) do
    Agent.start_link(fn -> %{} end, name: __MODULE__)
  end

  def save(%User{} = user) do
    Agent.update(__MODULE__, &update_state(&1, user))
  end

  def get_all_users() do
    Agent.get(__MODULE__, fn state -> {:ok, state} end)
  end


  defp update_state(state, %User{id: id} = user), do: Map.put(state, id, user)
end
