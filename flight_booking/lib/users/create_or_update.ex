defmodule FlightBooking.Users.CreateOrUpdate do
  alias FlightBooking.Users
  alias Users.Agent, as: UserAgent
  alias Users.User

  def call(%{id: id, name: name, email: email, cpf: cpf}) do
    (id || UUID.uuid4())
    |> User.build(name, email, cpf)
    |> save_user()
  end

  defp save_user({:ok, %User{} = user}) do
    UserAgent.save(user)

    {:ok, "User created or updated successfully"}
  end
  defp save_user({:error, _reason} = error), do: error
end
