defmodule ReportsGenerator do

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
    "reports/#{filename}"
    |> File.stream!()
    |> Enum.reduce(%{}, fn line, report ->
      [id, food_name, price] = parse_line(line)
      Map.put(report, id, price)
    end)
  end

  defp handle_file({:ok, file_content}), do: file_content
  defp handle_file({:error, _reason}), do: "Error while opening file!"

  defp parse_line(line) do
    line
    |> String.trim()
    |> String.split(",")
    |> List.update_at(2, &String.to_integer/1)
  end
end
