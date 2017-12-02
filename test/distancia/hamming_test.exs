defmodule Distancia.HammingTest do
  use ExUnit.Case

  alias Distancia.Hamming

  test "calculate returns valid distance (basic)" do
    a = "abc"
    b = "abd"

    assert Hamming.calculate(a, b) == 1
  end

  test "calculate returns valid distance (advanced)" do
    a = "This is Sparta!"
    b = "Thiz iz Sparta!"

    assert Hamming.calculate(a, b) == 2
  end

  test "calculate returns zero distance for two the same points" do
    a = b = "abc"

    assert Hamming.calculate(a, b) == 0
  end

  test "calculate is deterministic" do
    a = :rand.normal()
    b = :rand.normal()

    first_result = Hamming.calculate(a, b)
    second_result = Hamming.calculate(a, b)

    assert first_result == second_result
  end
end
