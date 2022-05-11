defmodule Rockelivery.UserTest do
  # Just postigres
  use Rockelivery.DataCase, async: true

  import Rockelivery.Factory

  alias Rockelivery.User
  alias Ecto.Changeset

  describe "changeset/2" do
    test "When valid params, return a valid changeset" do
      params = build(:user_params)
      response = User.changeset(params)
      assert %Changeset{changes: %{name: "Carl Jhonson"}, valid?: true} = response
    end

    test "When update changeset, return the updated changeset" do
      params = build(:user_params)

      update_params = %{
        name: "Tommy Vercetti",
        password: "pwd123"
      }

      response =
        params
        |> User.changeset()
        |> User.changeset(update_params)

      assert %Changeset{changes: %{name: "Tommy Vercetti"}, valid?: true} = response
    end

    test "When error, return error" do
      params = build(:user_params, %{age: 10, password: "1"})

      response = User.changeset(params)

      expected_response = %{
        age: ["must be greater than or equal to 18"],
        password: ["should be at least 6 character(s)"]
      }

      assert errors_on(response) == expected_response
    end
  end
end
