defmodule ListFilter do
  def call(list), do: even_number_list(list)

  defp even_number_list([]), do: 0
  defp even_number_list(list) do
    numberList = Enum.filter(list, fn element -> Regex.match?(~r/^[0-9]*$/, element) end)
    length(Enum.filter(numberList, fn element -> rem(String.to_integer(element), 2) == 1 end))
  end
end
