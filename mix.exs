defmodule EchoBoy.MixProject do
  use Mix.Project

  def project do
    [
      app: :echo_boy,
      version: "0.1.0",
      elixir: "~> 1.6",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  def application do
    [
      mod: {EchoBoy, []},
      extra_applications: [:logger]
    ]
  end

  defp deps do
    [
      {:cowboy, "~> 2.5.0"},
      {:plug, "~> 1.7.0"},
      {:plug_cowboy, "~> 2.0.0"},
      {:websockex, "~> 0.4", only: :test},
      {:httpoison, "~> 1.4.0", only: [:dev, :test]}
    ]
  end
end
