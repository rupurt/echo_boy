defmodule EchoBoyTest do
  use ExUnit.Case
  doctest EchoBoy

  test "echos the websocket message" do
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
    end

    Process.register self(), :test
    url = "ws://localhost:#{EchoBoy.Config.port}/ws/"
    {:ok, pid} = Client.start_link(url)

    Client.send_msg(pid, "hello world!")

    assert_receive "hello world!"
  end
end
