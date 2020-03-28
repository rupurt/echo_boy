defmodule EchoBoy.MixProject do
  use Mix.Project

  def project do
    [
      app: :echo_boy,
      version: "0.6.0",
      elixir: "~> 1.7",
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
      {:cowboy, "~> 2.6"},
      {:plug, "~> 1.10.0"},
      {:plug_cowboy, "~> 2.0"},
      {:dialyxir, "~> 1.0", only: :dev, runtime: false},
      {:mix_test_watch, "~> 1.0", only: :dev, runtime: false},
      {:ex_doc, ">= 0.0.0", only: :dev},
      {:httpoison, "~> 1.5.0", only: [:dev, :test]},
      {:websockex, "~> 0.4", only: :test}
    ]
  end
end
