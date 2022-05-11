defmodule Rockelivery.Users.CreateTest do
  use Rockelivery.DataCase, async: true

  alias Rockelivery.{Error, User}
  alias Rockelivery.Users.Create

  import Rockelivery.Factory

  describe "call/1" do
    test "When valid params, return an user" do
      params = build(:user_params)

      response = Create.call(params)
      assert {:ok, %User{id: _id, age: 30}} = response
    end

    test "When invalid params, return an error" do
      params = build(:user_params, %{age: 10})

      response = Create.call(params)

      assert {:error, %Error{status: :bad_request, result: changeset}} = response

      expected_response = %{age: ["must be greater than or equal to 18"]}
      assert errors_on(changeset) == expected_response
    end
  end
end
