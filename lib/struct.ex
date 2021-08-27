defmodule WorkerAge do
  defstruct age: 18

  def new(in_age) do
    cond do
      not is_integer(in_age) -> {:error, "R u stupid?!"}
      in_age < 18 -> {:error, "Low age"}
      in_age > 63 -> {:error, "He is dying, man!"}
      true -> %WorkerAge{age: in_age}
    end
  end
end

defmodule Worker do
  defstruct age: 18

  def new(in_age) do
    res1 =
      if is_integer(in_age) do
        %Worker{age: in_age}
      else
        {:error, "Bad type"}
      end

    res2 =
      if res1 == %Worker{age: in_age} and in_age >= 18 do
        %Worker{age: in_age}
      else
        {:error, "Low age"}
      end

    if res2 == %Worker{age: in_age} and in_age <= 63 do
      %Worker{age: in_age}
    else
      {:error, "He is too old, goddamn!"}
    end
  end
end
