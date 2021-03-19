defmodule Exlivery.Factory do
  use ExMachina

  alias Exlivery.Users.User
  alias Exlivery.Orders.{Item, Order}

  def user_factory() do
    %User{
      name: "Test",
      cpf: "123456",
      address: "Granville ave",
      email: "mail@email.com",
      age: 29
    }
  end

  def item_factory() do
    %Item{
      description: "Pepperoni Pizza",
      category: :pizza,
      unity_price: Decimal.new("28.36"),
      quantity: 1
    }
  end

  def order_factory do
    %Order{
      address: "Granville ave",
      user_cpf: "123456",
      items: [
        build(:item),
        build(:item, description: "Chicken Pizza", unity_price: Decimal.new("19.99"))
      ],
      total_price: Decimal.new("48.35")
    }
  end



end
