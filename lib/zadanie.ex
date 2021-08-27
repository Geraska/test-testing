defmodule Ilya do
  def start_count(x, limit) do
    start_map = %{number: x, number_2_level: x * x, number_3_level: x * x * x}
    start_count(start_map, [start_map], limit)
  end

  defp start_count(start_map, acc, limit) when start_map.number <= limit do
    new_num = start_map.number + 1
    new_square = new_num * new_num
    new_cube = new_square * new_num
    new_map = %{number: new_num, number_2_level: new_square, number_3_level: new_cube}
    start_count(new_map, acc ++ [new_map], limit)
  end

  defp start_count(start_map, acc, limit) when start_map.number >= limit do
    acc
  end
end

defmodule Lesson do
  def lesson(value) do
    Enum.map(1..value, fn x ->
      %{a: x, b: x * x, c: x * x * x}
    end)
  end
end





