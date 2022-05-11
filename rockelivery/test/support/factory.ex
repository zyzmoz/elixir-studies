defmodule Rockelivery.Factory do
  use ExMachina

  def user_params_factory do
    %{
      age: 30,
      address: "Groove St",
      cep: "GTASAN",
      cpf: "12345678900",
      email: "cj@lossantos.gta",
      password: "pwd123",
      name: "Carl Jhonson"
    }
  end
end
