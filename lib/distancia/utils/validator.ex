defmodule Distancia.Utils.Validator do
  def validate!(p, q) do
    case validate(p, q) do
      { :ok, result } -> result
      { :error, reason } -> raise ArgumentError, message: reason
    end
  end

  def validate(p, q) when length(p) !== length(q) do
    { :error, "The arguments must have the same lenght." }
  end

  def validate(p, q) when is_list(p) and is_list(q),     do: { :ok, [p, q] }
  def validate(p, q) when is_tuple(p) and is_tuple(q),   do: { :ok, [p, q] }
  def validate(p, q) when is_number(p) and is_number(q), do: { :ok, [p, q] }
  def validate(p, q) when is_binary(p) and is_binary(q), do: { :ok, [p, q] }

  def validate(_, _) do
    { :error, "Both arguments must be the same type (lists, tuples, numbers or binaries)." }
  end
end
