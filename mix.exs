defmodule Distancia.Mixfile do
  use Mix.Project

  def project do
    [
      app: :distancia,
      version: "0.1.0",
      elixir: "~> 1.5",
      start_permanent: Mix.env == :prod,
      description: description(),
      package: package(),
      deps: deps(),
      name: "Distancia",
      source_url: "https://github.com/walerian777/distancia"
    ]
  end

  def application do
    [
      extra_applications: [:logger]
    ]
  end

  defp deps do
    []
  end

  defp description do
  end

  defp package do
    [
      files: ["lib", "priv", "mix.exs", "README*", "readme*", "LICENSE*", "license*"],
      maintainers: ["Walerian Sobczak"],
      licenses: ["MIT"],
      links: %{"GitHub" => "https://github.com/walerian777/distancia"}
    ]
  end
end
