defmodule MealTracker.Repo do
  use Ecto.Repo,
    otp_app: :meal_tracker,
    adapter: Ecto.Adapters.SQLite3
end
