defmodule EchoBoy do
  use Application

  def start(_type, _args) do
    children = [
      Plug.Cowboy.child_spec(
        scheme: :http,
        plug: EchoBoy.Router,
        options: [
          port: EchoBoy.Config.port(),
          dispatch: dispatch()
        ]
      )
    ]

    opts = [strategy: :one_for_one, name: EchoBoy.Supervisor]
    Supervisor.start_link(children, opts)
  end

  defp dispatch do
    [
      {
        :_,
        [
          {"/ws", EchoBoy.WebSocket, []},
          {:_, Plug.Adapters.Cowboy.Handler, {EchoBoy.Router, []}}
        ]
      }
    ]
  end
end
