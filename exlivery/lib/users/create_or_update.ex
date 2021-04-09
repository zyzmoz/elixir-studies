defmodule Exlivery.Users.CreateOrUpdate do
  alias Exlivery.Users
  alias Users.Agent, as: UserAgent
  alias Users.User

  def call(%{name: name, cpf: cpf, email: email, age: age, address: address}) do
    name
    |> User.build(email, cpf, age, address)
    |> save_user()
  end

  defp save_user({:ok, %User{} = user }) do
    UserAgent.save(user)

    {:ok, "User created or updated successfully"}
  end
  defp save_user({:error, _reason} = error), do: error
end
