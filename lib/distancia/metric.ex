defmodule Distancia.Metric do
  @moduledoc false
  @callback calculate(Distancia.point, Distancia.point) :: number
end
