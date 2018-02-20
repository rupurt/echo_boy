defmodule EchoBoy.Supervisor do
  use Supervisor

  def start_link(port) do
    Supervisor.start_link(__MODULE__, port, name: __MODULE__)
  end

  def init(port) do
    [EchoBoy.Server.child_spec(port: port)]
    |> Supervisor.init(strategy: :one_for_one)
  end
end
