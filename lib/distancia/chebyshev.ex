defmodule Distancia.Chebyshev do
  @moduledoc false
  @behaviour Distancia.Metric

  alias Distancia.Utils.Parser
  alias Distancia.Utils.Validator

  def calculate(p, q) do
    [p, q]
    |> Validator.validate!()
    |> Parser.map_to_lists()
    |> Enum.zip()
    |> Enum.map(fn {a, b} -> abs(a - b) end)
    |> Enum.max()
  end
end
