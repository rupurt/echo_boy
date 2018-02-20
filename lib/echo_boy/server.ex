defmodule EchoBoy.Server do
  def child_spec(port: port) do
    Plug.Adapters.Cowboy.child_spec(
      scheme: :http,
      plug: EchoBoy.Router,
      options: [
        port: port,
        dispatch: dispatch()
      ]
    )
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
