defmodule Distancia.Utils.ValidatorTest do
  use ExUnit.Case

  alias Distancia.Utils.Validator

  test "validate returns :ok for two lists" do
    a = [1, 2]
    b = [3, 4]
    assert {:ok, _} = Validator.validate([a, b])
  end

  test "validate returns :ok for two tuple" do
    a = {1, 2}
    b = {3, 4}
    assert {:ok, _} = Validator.validate([a, b])
  end

  test "validate returns :ok for two numbers" do
    a = 1
    b = 3
    assert {:ok, _} = Validator.validate([a, b])
  end

  test "validate returns :ok for two binaries" do
    a = "12"
    b = "34"
    assert {:ok, _} = Validator.validate([a, b])
  end

  test "validate returns array of arguments when they are valid" do
    a = [1, 2]
    b = [3, 4]
    assert {:ok, [^a, ^b]} = Validator.validate([a, b])
  end

  test "validate returs :error for arrays of different length" do
    a = [1, 2]
    b = [3, 4, 5]
    assert {:error, _} = Validator.validate([a, b])
  end

  test "validate returs :error for tuples of different length" do
    a = {1, 2}
    b = {3, 4, 5}
    assert {:error, _} = Validator.validate([a, b])
  end

  test "validate returs :error for binaries of different length" do
    a = "abc"
    b = "abcd"
    assert {:error, _} = Validator.validate([a, b])
  end

  test "validate returs :ok for numbers of different length" do
    a = 123
    b = 1234
    assert {:ok, _} = Validator.validate([a, b])
  end

  test "validate returs :error for arguments of different type" do
    a = [1, 2]
    b = {3, 4}
    assert {:error, _} = Validator.validate([a, b])
  end

  test "validate! returns the result for :ok" do
    a = [1, 2]
    b = [3, 4]
    assert [^a, ^b] = Validator.validate!([a, b])
  end

  test "validate! raises an ArgumentError for :error" do
    a = [1, 2]
    b = [3, 4, 5]
    assert_raise ArgumentError, fn ->
      Validator.validate!([a, b])
    end
  end
end
