defmodule SummonerTest do
  use ExUnit.Case, async: true

  # test "sum of two maps" do
  #   data_list = [%{a: 1}, %{a: 1}]
  #   assert Summoner.sum(data_list) == %{a: 2}
  # end

  # test "sum of three maps" do
  #   data_list = [%{a: 1}, %{a: 1}, %{a: 1}]
  #   assert Summoner.sum(data_list) == %{a: 3}
  # end

  # test "summul of two maps" do
  #   data_list = [%{a: 1}, %{a: 1}]
  #   assert SummonReduce.summul(data_list) == %{sum: %{a: 2}, mul: %{a: 1}}
  # end

  # test "summul of three maps" do
  #   data_list = [%{a: 1}, %{a: 1}, %{a: 1}]
  #   assert SummonReduce.summul(data_list) == %{sum: %{a: 3}, mul: %{a: 1}}
  # end

  test "masochism with numbers" do
    value = 4

    mustbe = [
      %{a: 1, b: 1, c: 1},
      %{a: 2, b: 4, c: 8},
      %{a: 3, b: 9, c: 27},
      %{a: 4, b: 16, c: 64}
    ]

    assert Lesson.lesson(value) == mustbe
  end
end
