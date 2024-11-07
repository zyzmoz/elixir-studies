defmodule MealTracker.Meals.Read do
  alias Ecto.UUID
  alias MealTracker.{Repo, Meal, Error}

  def call() do
    Repo.all(Meal)
  end

  def by_id(id) do
    case UUID.cast(id) do
      :error -> {:error, Error.build_id_format_invalid("Meal")}
      {:ok, uuid} -> get(uuid)
    end
  end

  defp get(id) do
    case Repo.get(Meal, id) do
      nil -> {:error, Error.build_not_found_error("Meal")}
      meal -> {:ok, meal}
    end
  end
end
