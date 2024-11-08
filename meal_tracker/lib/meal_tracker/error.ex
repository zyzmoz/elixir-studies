defmodule MealTracker.Error do
  @keys [:status, :result]

  @enforce_keys @keys

  defstruct @keys

  def build(status, result) do
    %__MODULE__{
      status: status,
      result: result
    }
  end

  def build_not_found_error(resource), do: build(:not_found, "#{resource} not found")
  def build_id_format_invalid(resource), do: build(:bad_request, "Invalid #{resource} id")
end
