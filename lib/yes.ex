defmodule TestList do
  def empty?([]), do: true
  def empty?([_ | _]), do: false
end

defmodule Polymorphic do
  def double(x) when is_number(x), do: 2 * x
  def double(x) when is_binary(x), do: x <> x
end

defmodule NaturalNums do
  def print(1), do: IO.puts(1)

  def print(n) when n >= 2 do
    print(n - 1)
    IO.puts(n)
  end
end

defmodule ListHelper do
  def sum(list) when is_list(list) do
    do_sum(0, list)
  end

  defp do_sum(current_sum, []) do
    current_sum
  end

  defp do_sum(current_sum, [head | tail]) when is_integer(current_sum) do
    do_sum(head + current_sum, tail)
  end
end

defmodule Training do
  def positive(list) do
    do_positive([], list)
  end

  defp do_positive(current_list, []) do
    Enum.reverse(current_list)
  end

  defp do_positive(current_list, list) do
    [head | tail] = list

    head =
      if head < 0 do
        abs(head)
      else
        head
      end

    do_positive([head | current_list], tail)
  end
end

defmodule Training1 do
  def list_len(list) do
    do_list_len(0, list)
  end

  defp do_list_len(count, []) do
    count
  end

  defp do_list_len(count, [head | tail]) do
    do_list_len(count + 1, tail)
  end
end

# defmodule Training2 do
#   def range(from, to) when is_integer(from) and is_integer(to) do
#     if from < to do
#       do_range([], from, to)
#     else
#       Enum.reverse(do_range([], from, to))
#     end
#   end

#   defp do_range(list, from, to) do
#     new_list = [to | list]
#     do_range(new_list, to, from)
#   end
# end

defmodule NumHelper do
  def sum_nums(enumerable) do
    Enum.reduce(enumerable, 0, &add_num/2)
  end

  defp add_num(num, sum) when is_number(num), do: sum + num
  defp add_num(_, sum), do: sum
end

defmodule TodoList do
  defstruct auto_id: 1, entries: %{}
  def new(), do: %TodoList{}

  def add_entry(todo_list, entry) do
    entry = Map.put(entry, :id, todo_list.auto_id)

    new_entries =
      Map.put(
        todo_list.entries,
        todo_list.auto_id,
        entry
      )

    %TodoList{todo_list | entries: new_entries, auto_id: todo_list.auto_id + 1}
  end

  def entries(todo_list, date) do
    todo_list.entries
    |> Stream.filter(fn {_, entry} -> entry.date == date end)
    |> Enum.map(fn {_, entry} -> entry end)
  end

  def update_entry(todo_list, entry_id, updater_fun) do
    case Map.fetch(todo_list.entries, entry_id) do
      :error ->
        todo_list

      {:ok, old_entry} ->
        new_entry = updater_fun.(old_entry)
        new_entries = Map.put(todo_list.entries, new_entry.id, new_entry)
        %TodoList{todo_list | entries: new_entries}
    end
  end
end

defmodule Fraction do
  defstruct a: nil, b: nil

  def new(a, b) do
    %Fraction{a: a, b: b}
  end

  def value(%Fraction{a: a, b: b}) do
    a / b
  end

  def add(%Fraction{a: a1, b: b1}, %Fraction{a: a2, b: b2}) do
    new(
      a1 * b2 + a2 * b1,
      b2 * b1
    )
  end
end
