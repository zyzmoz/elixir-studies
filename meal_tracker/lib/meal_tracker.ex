defmodule MealTracker do
  alias MealTracker.Meals.Create, as: MealCreate
  alias MealTracker.Meals.Read, as: MealRead
  alias MealTracker.Meals.Update, as: MealUpdate
  alias MealTracker.Meals.Delete, as: MealDelete
  @moduledoc """
  MealTracker keeps the contexts that define your domain
  and business logic.

  Contexts are also responsible for managing your data, regardless
  if it comes from the database, an external API or others.
  """

  defdelegate create_meal(params), to: MealCreate, as: :call
  defdelegate get_meal_by_id(params), to: MealRead, as: :by_id
  defdelegate get_meals(), to: MealRead, as: :call
  defdelegate delete_meal(params), to: MealDelete, as: :call
  defdelegate update_meal(params), to: MealUpdate, as: :call
end
