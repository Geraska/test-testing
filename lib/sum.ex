defmodule Summoner do
  def sum([]) do
    0
  end

  def sum(data_list) do
    sum(data_list, %{a: 0})
  end

  defp sum([], acc) do
    acc
  end

  defp sum(data_list, acc) do
    [head | tail] = data_list
    new_acc = %{a: head.a + acc.a}
    sum(tail, new_acc)
  end

  def mul([]) do
    0
  end

  def mul(data_list) do
    mul(data_list, %{a: 1})
  end

  defp mul([], acc) do
    acc
  end

  defp mul(data_list, acc) do
    [head | tail] = data_list
    new_acc = %{a: head.a * acc.a}
    mul(tail, new_acc)
  end

  def summul(data_list) do
    %{sum: sum(data_list), mul: mul(data_list)}
  end
end

defmodule Summon do
  def summul([]) do
    0
  end

  def summul(data_list) do
    summul(data_list, %{a: 0}, %{a: 1})
  end

  defp summul([head | tail], acc_sum, acc_mul) do
    sum = %{a: head.a + acc_sum.a}
    mul = %{a: head.a * acc_mul.a}
    summul(tail, sum, mul)
  end

  defp summul([], sum, mul) do
    %{sum: sum, mul: mul}
  end
end

defmodule SummonReduce do
  def summul([]) do
    0
  end

  def summul(data_list) do
    sum = Enum.reduce(data_list, %{a: 0}, fn x, acc_sum -> %{a: x.a + acc_sum.a} end)
    mul = Enum.reduce(data_list, %{a: 1}, fn x, acc_mul -> %{a: x.a * acc_mul.a} end)
    %{sum: sum, mul: mul}
  end
end
