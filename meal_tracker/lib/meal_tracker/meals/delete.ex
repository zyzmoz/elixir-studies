defmodule MealTracker.Meals.Delete do
  alias Ecto.UUID
  alias MealTracker.{Error, Repo, Meal}


  def call(id) do
    case UUID.cast(id) do
      :error -> {:error, Error.build_id_format_invalid("Meal")}
      {:ok, uuid} -> delete(uuid)
    end
  end

  defp delete(id) do
    case Repo.get(Meal, id) do
      nil -> {:error, Error.build_not_found_error("Meal")}
      meal -> Repo.delete(meal)
    end
  end
end
