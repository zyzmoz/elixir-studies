defmodule MealTracker.Meals.Update do
  alias MealTracker.Meal
  alias Ecto.UUID
  alias MealTracker.{Error, Repo}

  def call(%{"id" => id} = params) do
    case UUID.cast(id) do
      :error -> {:error, Error.build_id_format_invalid(id)}
      {:ok, _uuid} -> update(params)
    end
  end

  defp update(%{"id" => id} = params) do
    case Repo.get(Meal, id) do
      nil -> {:error, Error.build_not_found_error("Meal")}
      meal -> handle_update(meal, params)
    end
  end

  defp handle_update(meal, params) do
    meal
    |> Meal.changeset(params)
    |> Repo.update()
  end
end
