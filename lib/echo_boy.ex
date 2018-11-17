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

    {:ok, _} = Supervisor.start_link(children, strategy: :one_for_one, name: Tai.Supervisor)
  end

  defp dispatch do
    [
      {
        :_,
        [
          {"/ws", EchoBoy.WebSocket, []}
        ]
      }
    ]
  end
end
