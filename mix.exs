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
      {:cowboy, "~> 1.0"},
      {:plug, "~> 1.0"},
      {:websockex, "~> 0.4", only: :test}
    ]
  end
end
