defmodule EchoBoy.MixProject do
  use Mix.Project

  def project do
    [
      app: :echo_boy,
      version: "0.2.0",
      elixir: "~> 1.6",
      package: package(),
      start_permanent: Mix.env() == :prod,
      description: description(),
      deps: deps()
    ]
  end

  defp description do
    "HTTP and WebSocket echo server as an OTP Application"
  end

  defp package do
    %{
      licenses: ["MIT"],
      maintainers: ["Alex Kwiatkowski"],
      links: %{"GitHub" => "https://github.com/rupurt/echo_boy"}
    }
  end

  def application do
    [
      mod: {EchoBoy, []},
      extra_applications: [:logger]
    ]
  end

  defp deps do
    [
      {:cowboy, "~> 1.0.0"},
      {:plug, "~> 1.7.0"},
      {:plug_cowboy, "~> 1.0.0"},
      {:ex_doc, ">= 0.0.0", only: :dev},
      {:websockex, "~> 0.4", only: :test},
      {:httpoison, "~> 1.4.0", only: [:dev, :test]}
    ]
  end
end
