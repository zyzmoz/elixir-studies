defmodule GenReport do
  alias GenReport.Parser

  def build(file_name) do
    {:ok, res} =
      file_name
      |> Parser.parse_file()

    result = Enum.reduce(res, report_acc(), fn line, report ->
        get_values(line, report)
      end)

    {:ok, result}
  end

  def build(), do: {:error, "invalid file!"}

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
