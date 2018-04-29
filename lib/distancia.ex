defmodule Distancia do
  @moduledoc """
  Distancia is a module which provides functions that calculate distances between two points.

  It allows to perform calulations in various metrics:
  - Euclidean (`Distancia.euclidean/2`)
  - Manhattan (`Distancia.manhattan/2`)
  - Chebyshev (`Distancia.chebyshev/2`)
  - Hamming (`Distancia.hamming/2`)
  """

  @typedoc """
  Point can be represented as a list, a tuple, a number or a string.
  """

  @type point :: list | tuple | number | String.t()

  @doc """
  Calculates the Euclidean distance between points `p` and `q`.

  The Euclidean distance is the most common understanding of distance - a straight line between two points in the Cartesian plane.

  ## Examples

      iex> Distancia.euclidean(1, 2)
      1.0
      iex> Distancia.euclidean([2, -1, 6], [8, 5, -4])
      13.114877048604
      iex> Distancia.euclidean({1.34, 2}, {-3.13, 5.3})
      5.556158745032398

  """
  @spec euclidean(point, point) :: number
  defdelegate euclidean(p, q), to: Distancia.Euclidean, as: :calculate

  @doc """
  Calculates the Manhattan distance between points `p` and `q`.

  The Manhattan distance is a sum of all horizontal and vertical segments between two points in a grid.

  ## Examples

      iex> Distancia.manhattan(1, 2)
      1
      iex> Distancia.manhattan([2, -1, 6], [8, 5, -4])
      22
      iex> Distancia.manhattan({1.34, 2}, {-3.13, 5.3})
      7.77

  """
  @spec manhattan(point, point) :: number
  defdelegate manhattan(p, q), to: Distancia.Manhattan, as: :calculate

  @doc """
  Calculates the Chebyshev distance between points `p` and `q`.

  Simply speaking, the Chebyshev distance is equal to the minimum number of moves needed by a king to go from one point to another in the game of chess.

  ## Examples

      iex> Distancia.chebyshev(1, 2)
      1
      iex> Distancia.chebyshev([2, -1, 6], [8, 5, -4])
      10
      iex> Distancia.chebyshev({1.34, 2}, {-3.13, 5.3})
      4.47

  """
  @spec chebyshev(point, point) :: number
  defdelegate chebyshev(p, q), to: Distancia.Chebyshev, as: :calculate

  @doc """
  Calculates the Hamming distance between strings `p` and `q`.

  The Hamming distance is the amount of elements which differ between two strings.

  ## Examples

      iex> Distancia.hamming(1, 2)
      1
      iex> Distancia.hamming("This is Sparta!", "Thiz iz Sparta!")
      2
      iex> Distancia.hamming("2173896", "2233796")
      3

  """
  @spec hamming(point, point) :: number
  defdelegate hamming(p, q), to: Distancia.Hamming, as: :calculate
end
