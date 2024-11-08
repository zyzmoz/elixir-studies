defmodule RockeliveryWeb.UsersView do
  use RockeliveryWeb, :view

  alias Rockelivery.User

  def render("create.json", %{user: %User{} = user}) do
    %{
      message: "User created!",
      user: user

      #  %{
      #   id: user.id,
      #   name: user.name
      # }
    }
  end

  def render("show.json", %{user: user}), do: %{user: user}
end
