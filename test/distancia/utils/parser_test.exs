defmodule Distancia.Utils.ParserTest do
  use ExUnit.Case

  alias Distancia.Utils.Parser

  test "to_list parses a list" do
    list = [1, 2, 3]
    assert Parser.to_list(list) == list
  end

  test "to_list parses a tuple" do
    tuple = {1, 2, 3}
    list = [1, 2, 3]
    assert Parser.to_list(tuple) == list
  end

  test "to_list parses a number" do
    number = 1
    list = [1]
    assert Parser.to_list(number) == list
  end

  test "to_list parses a binary" do
    binary = "test"
    charlist = 'test'
    assert Parser.to_list(binary) == charlist
  end

  test "map_to_lists parses a list of arguments to lists" do
    arguments = [
      [1, 2],
      {1, 2},
      "test",
      12_345
    ]

    lists = [
      [1, 2],
      [1, 2],
      'test',
      [12_345]
    ]

    assert Parser.map_to_lists(arguments) == lists
  end
end
