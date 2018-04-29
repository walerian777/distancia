defmodule Distancia.Manhattan do
  @moduledoc false
  @behaviour Distancia.Metric

  alias Distancia.Utils.Parser
  alias Distancia.Utils.Validator

  def calculate(p, q) do
    [p, q]
    |> Validator.validate!()
    |> Parser.map_to_lists()
    |> Enum.zip()
    |> Enum.reduce(0, fn {a, b}, acc -> abs(a - b) + acc end)
  end
end
