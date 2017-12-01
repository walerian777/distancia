defmodule Distancia.Euclidean do
  alias Distancia.Utils.Parser
  alias Distancia.Utils.Validator

  def calculate(p, q) do
    Validator.validate!(p, q)
    |> Parser.map_to_lists()
    |> Enum.zip()
    |> Enum.reduce(0, fn({a, b}, acc) -> :math.pow(a - b, 2) + acc end)
    |> :math.sqrt()
  end
end
