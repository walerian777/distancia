defmodule Distancia.Utils.Parser do
  @moduledoc false

  def map_to_lists(args) do
    Enum.map(args, &to_list/1)
  end

  def to_list(arg), do: parse_to_list(arg)

  defp parse_to_list(list) when is_list(list), do: list
  defp parse_to_list(tuple) when is_tuple(tuple), do: Tuple.to_list(tuple)
  defp parse_to_list(number) when is_number(number), do: [number]
  defp parse_to_list(binary) when is_binary(binary), do: String.to_charlist(binary)
end
