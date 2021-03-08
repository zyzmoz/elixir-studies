defmodule ListLength do
  @moduledoc """
  Documentation for `ListLength`.
  """

  @doc """
  Hello world.

  ## Examples

      iex> ListLength.hello()
      :world

  """
  def call(list), do: list_length(list);

  defp list_length([]), do: 0

  defp list_length(list), do: length(list)
end
