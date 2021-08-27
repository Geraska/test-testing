defprotocol Valid do
  @doc "Возвращает true, усли данные можно считать допустимым"
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
  @spec valid?(%Tower{}) :: boolean
  def valid?(%Tower{height: h, planemo: p}) do
    h >= 0 and p != nil
  end
end

defimpl Inspect, for: Tower do
  import Inspect.Algebra

  @spec inspect(%Tower{}, any) ::
          :doc_line
          | :doc_nil
          | binary
          | {:doc_collapse, pos_integer}
          | {:doc_force, any}
          | {:doc_break | :doc_color | :doc_cons | :doc_fits | :doc_group | :doc_string, any, any}
          | {:doc_nest, any, :cursor | :reset | non_neg_integer, :always | :break}
  def inspect(item, _options) do
    metres = concat(to_string(item.height), "m:")

    msg =
      concat([
        metres,
        break,
        item.name,
        ",",
        break,
        item.location,
        ",",
        break,
        to_string(item.planemo)
      ])
  end
end
