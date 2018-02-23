defmodule EchoBoyTest do
  use ExUnit.Case
  doctest EchoBoy

  defmodule Client do
    use WebSockex

    def start_link(url) do
      WebSockex.start_link(url, __MODULE__, :ok)
    end

    def handle_frame({_type, msg}, state) do
      send :test, msg
      {:ok, state}
    end

    def send_msg(pid, msg) do
      WebSockex.send_frame(pid, {:text, msg})
    end

    def handle_disconnect(conn_status, state) do
      send :test, {:disconnected, conn_status}
      {:ok, state}
    end
  end

  setup do
    Process.register self(), :test
    url = "ws://localhost:#{EchoBoy.Config.port}/ws/"
    {:ok, pid} = Client.start_link(url)

    {:ok, pid: pid}
  end

  test "echos the websocket message", %{pid: pid} do
    Client.send_msg(pid, "hello world!")

    assert_receive "hello world!"
  end

  test "can disconnect the client", %{pid: pid} do
    Client.send_msg(pid, "close")

    assert_receive {:disconnected, %{attempt_number: 1, conn: %WebSockex.Conn{}}}
  end
end
