defmodule Distancia.Hamming do
  @moduledoc false
  @behaviour Distancia.Metric

  alias Distancia.Utils.Parser
  alias Distancia.Utils.Validator

  def calculate(p, q) do
    [p, q]
    |> Validator.validate!()
    |> Parser.map_to_lists()
    |> Enum.zip()
    |> Enum.reduce(0, fn({a, b}, acc) ->
      case a === b do
        true  -> acc
        false -> acc + 1
      end
    end)
  end
end
