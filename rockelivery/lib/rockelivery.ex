defmodule Rockelivery do
  alias Rockelivery.Users.Create, as: UserCreate
  alias Rockelivery.Users.Get, as: UserGet
  alias Rockelivery.Users.Delete, as: UserDelete
  alias Rockelivery.Users.Update, as: UserUpdate

  defdelegate create_user(params), to: UserCreate, as: :call
  defdelegate get_user_by_id(params), to: UserGet, as: :by_id

  defdelegate delete_user_by_id(params), to: UserDelete, as: :call

  defdelegate update_user(params), to: UserUpdate, as: :call
end
