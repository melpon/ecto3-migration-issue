defmodule MyApp.MixProject do
  use Mix.Project

  def project do
    [
      app: :my_app,
      version: "0.1.0",
      elixir: "~> 1.7",
      deps: deps()
    ]
  end

  def application do
    [
      mod: {MyApp.Application, []}
    ]
  end

  defp deps do
    [
      {:ecto, "~> 2.2.11"},
      {:postgrex, ">= 0.0.0"}
    ]
  end
end
