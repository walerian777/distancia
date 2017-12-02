defmodule Distancia.ManhattanTest do
  use ExUnit.Case

  alias Distancia.Manhattan

  test "calculate returns valid distance (basic)" do
    a = [1, 1]
    b = [4, 5]

    assert Manhattan.calculate(a, b) == 7
  end

  test "calculate returns valid distance (advanced)" do
    a = [2, 4, 5, 3.15, 8, 2]
    b = [3, 1, 5, -3, 7, 2.8]

    assert Manhattan.calculate(a, b) == 11.95
  end

  test "calculate returns zero distance for two the same points" do
    a = b = [0, 0]

    assert Manhattan.calculate(a, b) == 0
  end

  test "calculate is deterministic" do
    a = :rand.normal()
    b = :rand.normal()

    first_result = Manhattan.calculate(a, b)
    second_result = Manhattan.calculate(a, b)

    assert first_result == second_result
  end
end
