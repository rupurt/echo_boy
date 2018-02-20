defmodule EchoBoy do
  use Application

  def start(_type, _args) do
    EchoBoy.Config.port
    |> EchoBoy.Supervisor.start_link
  end
end
