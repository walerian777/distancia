defmodule Distancia.Utils.Validator do
  @moduledoc false

  def validate!(args) do
    case validate(args) do
      {:ok, result} -> result
      {:error, reason} -> raise ArgumentError, message: reason
    end
  end

  def validate(args) do
    args
    |> validate_type()
    |> validate_length()
  end

  def validate_type([p, q]) when is_list(p) and is_list(q),     do: {:ok, [p, q]}
  def validate_type([p, q]) when is_tuple(p) and is_tuple(q),   do: {:ok, [p, q]}
  def validate_type([p, q]) when is_number(p) and is_number(q), do: {:ok, [p, q]}
  def validate_type([p, q]) when is_binary(p) and is_binary(q), do: {:ok, [p, q]}

  def validate_type(_different_types) do
    {:error, "Both arguments must be the same type (lists, tuples, numbers or binaries)."}
  end

  def validate_length(error = {:error, _}), do: error

  def validate_length({_, [p, q]}) when is_list(p) and length(p) !== length(q) do
    {:error, "The arguments must have the same lenght."}
  end

  def validate_length({_, [p, q]}) when is_tuple(p) and tuple_size(p) !== tuple_size(q) do
    {:error, "The arguments must have the same lenght."}
  end

  def validate_length(result = {_, [p, q]}) when is_binary(p) do
    if String.length(p) !== String.length(q) do
      {:error, "The arguments must have the same lenght."}
    else
      result
    end
  end

  def validate_length(result), do: result
end
