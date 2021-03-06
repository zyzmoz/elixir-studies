defmodule ReportsGenerator do
  @available_foods [
    "açaí",
    "churrasco",
    "esfirra",
    "hambúrguer",
    "pastel",
    "pizza",
    "prato_feito",
    "sushi"
  ]

  @options ["foods", "users"]

  alias ReportsGenerator.Parser

  def build(filename) do
    # case File.read("reports/#{filename}") do
    #   {:ok, result} -> result
    #   {:error, reason} -> reason
    # end
    # "reports/#{filename}"
    # |> File.read()
    # |> handle_file()
    # "reports/#{filename}"
    # |> File.stream!()
    # |> Enum.map(fn line -> parse_line(line) end)
    # "reports/#{filename}"
    # |> File.stream!()
    # |> Enum.reduce(report_acc(), fn line, report ->
    #   [id, food_name, price] = parse_line(line)
    #   Map.put(report, id, report[id] + price)
    # end)
    filename
    |> Parser.parse_file()
    |> Enum.reduce(report_acc(), fn line, report ->
      sum_values(line, report)
    end)
  end

  defp sum_values([id, food_name, price], %{"users" => users, "foods" => foods} = report) do
    users = Map.put(users, id, users[id] + price)
    foods = Map.put(foods, food_name, foods[food_name] + 1)

    %{report | "users" => users, "foods" => foods}
  end

  def report_from_many(file_names) when not is_list(file_names),
    do: {:error, "Please provide a list of strings"}

  def report_from_many(file_names) do
    file_names
    |> Task.async_stream(&build/1)
    |> Enum.reduce(report_acc(), fn {:ok, result}, report -> sum_reports(report, result) end)
  end

  defp sum_reports(%{"foods" => foods1, "users" => users1}, %{
         "foods" => foods2,
         "users" => users2
       }) do
    foods = merge_maps(foods1, foods2)
    users = merge_maps(users1, users2)

    %{"foods" => foods, "users" => users}
  end

  defp merge_maps(map1, map2) do
    Map.merge(map1, map2, fn _key, val1, val2 -> val1 + val2 end)
  end

  def fetch_higher_cost(report, option) when option in @options do
    {:ok, Enum.max_by(report[option], fn {_key, value} -> value end)}
  end

  def fetch_higher_cost(_report, _option), do: {:error, "Invalid Option!"}

  # defp handle_file({:ok, file_content}), do: file_content
  # defp handle_file({:error, _reason}), do: "Error while opening file!"

  defp report_acc do
    users = Enum.into(1..30, %{}, &{Integer.to_string(&1), 0})
    foods = Enum.into(@available_foods, %{}, &{&1, 0})
    %{"users" => users, "foods" => foods}
  end
end
