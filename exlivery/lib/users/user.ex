defmodule Exlivery.Users.User do
  @keys [:name, :cpf, :email, :age, :address]
  @enforce_keys @keys
  defstruct @keys

  # works like a constructor
  def build(name, email, cpf, age, address) when age >= 18 do
    {:ok,
     %__MODULE__{
       name: name,
       email: email,
       cpf: cpf,
       age: age,
       address: address
     }}
  end

  def build(_name, _email, _cpf, _age, _address), do: {:error, "Invalid parameters"}
end
