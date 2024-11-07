defmodule MealTracker.Meal do
  alias Ecto.Changeset
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}

  @required_params [:descricao, :calorias]

  schema "meals" do
    field :descricao, :string
    field :data, :utc_datetime
    field :calorias, :integer
  end

  def changeset(struct \\ %__MODULE__{}, params) do
    # cast values to types when possible
    # similar to JS
    struct
    |> cast(params, @required_params)
    |> add_current_date()
    # validate if all required are present
    |> validate_required(@required_params)
    # validate if it is equal or greater than 2
    |> validate_length(:descricao, min: 2)
  end

  defp add_current_date(%Changeset{} = changeset) do
    change(changeset, %{data: DateTime.utc_now() |> DateTime.truncate(:second)})
  end
end
