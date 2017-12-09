defmodule Distancia.Chebyshev do
  @moduledoc false

  alias Distancia.Utils.Parser
  alias Distancia.Utils.Validator

  def calculate(p, q) do
    Validator.validate!(p, q)
    |> Parser.map_to_lists()
    |> Enum.zip()
    |> Enum.map(fn({a, b}) -> abs(a - b) end)
    |> Enum.max()
  end
end
