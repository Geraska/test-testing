defprotocol Valid do
  @doc """
  Возвращает true, усли данные можно считать допустимым
  """
  def valid?(data)
end

defmodule Planemo do
  defstruct name: nil, gravity: 0, diameter: 0, distance_from_sun: 0
end

defimpl Valid, for: Planemo do
  def valid?(p) do
    p.gravity >= 0 and p.diameter >= 0 and
      p.distance_from_sun >= 0
  end
end

defmodule Tower do
  defstruct location: "", height: 20, planemo: "", name: ""
end

defimpl Valid, for: Tower do
  def valid?(%Tower{height: h, planemo: p}) do
    h >= 0 and p != nil
  end
end
