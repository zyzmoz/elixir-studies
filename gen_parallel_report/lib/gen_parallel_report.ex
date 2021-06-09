defmodule GenParallelReport do
  alias GenParallelReport.Parser

  def build(file_name) do
    {:ok, res} =
      file_name
      |> Parser.parse_file()

    result =
      Enum.reduce(res, report_acc(), fn line, report ->
        get_values(line, report)
      end)

    {:ok, result}
  end

  def report_from_many(file_names) when not is_list(file_names), do: {:error, "Invalid file list"}

  def report_from_many(file_names) do
    Task.async_stream(file_names, &build/1)
    |>Enum.reduce(report_acc(), fn {:ok, result}, report -> sum_reports(result, report) end)
  end

  defp sum_reports(
         {:ok, %{
           :all_hours => all_hours1,
           :hours_per_month => hours_per_month1,
           :hours_per_year => hours_per_year1
         }},
         %{
           :all_hours => all_hours2,
           :hours_per_month => hours_per_month2,
           :hours_per_year => hours_per_year2
         }
       ) do


    all_hours = merge_maps(all_hours1, all_hours2)
    hours_per_month =
      merge_maps_map(hours_per_month1, hours_per_month2)

    hours_per_year =
      merge_maps_map(hours_per_year1, hours_per_year2)

    %{:all_hours => all_hours, :hours_per_month => hours_per_month, :hours_per_year => hours_per_year}
  end

  #defp merge_maps(map, ), do: map

  defp merge_maps(map1, map2) do
    Map.merge(map1, map2, fn _key, val1, val2 -> val1 + val2 end)
  end

  defp merge_maps_map(map1, map2) do
    Map.merge(map1, map2, fn _key, sub_map1, sub_map2 ->
      Map.merge(sub_map1, sub_map2, fn _key, value1, value2 -> value1 + value2 end)
    end)
  end

  def build(), do: {:error, "Invalid file!"}

  # nome, horas trabalhadas, dia, mês e ano
  defp get_values(
         [name, worked_hours, _day, month, year],
         %{
           :all_hours => all_hours,
           :hours_per_month => hours_per_month,
           :hours_per_year => hours_per_year
         } = report
       ) do
    all_hours =
      Map.merge(all_hours, %{name => worked_hours}, fn _key, val1, val2 -> val1 + val2 end)

    hours_per_month =
      Map.merge(hours_per_month, %{name => %{month => worked_hours}}, fn _key, val1, val2 ->
        Map.merge(val1, val2, fn _key, vval1, vval2 -> vval1 + vval2 end)
      end)

    hours_per_year =
      Map.merge(hours_per_year, %{name => %{year => worked_hours}}, fn _key, val1, val2 ->
        Map.merge(val1, val2, fn _key, vval1, vval2 -> vval1 + vval2 end)
      end)

    %{
      report
      | :all_hours => all_hours,
        :hours_per_month => hours_per_month,
        :hours_per_year => hours_per_year
    }
  end

  defp report_acc(), do: create_report(%{}, %{}, %{})

  defp create_report(all_hours, hours_per_month, hours_per_year) do
    %{
      :all_hours => all_hours,
      :hours_per_month => hours_per_month,
      :hours_per_year => hours_per_year
    }
  end
end
