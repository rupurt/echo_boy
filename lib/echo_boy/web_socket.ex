defmodule EchoBoy.WebSocket do
  @behaviour :cowboy_websocket_handler

  def init(_, _req, _opts) do
    {:upgrade, :protocol, :cowboy_websocket}
  end

  @timeout 60_000

  @doc """
  Called on websocket connection initialization.
  """
  def websocket_init(_type, req, _opts) do
    state = %{}
    {:ok, req, state, @timeout}
  end

  @doc """
  Close the connection when the handler receives a 'close' message
  """
  def websocket_handle({:text, "close"}, req, state) do
    {:shutdown, req, state}
  end

  @doc """
  Send the payload back to the client for all other messages.
  Don't send a reply for other messages.
  """
  def websocket_handle({:text, message}, req, state) do
    {:reply, {:text, message}, req, state}
  end

  @doc """
  Format and forward elixir messages to client
  """
  def websocket_info(message, req, state) do
    {:reply, {:text, message}, req, state}
  end

  @doc """
  No matter why we terminate, remove all of this pids subscriptions
  """
  def websocket_terminate(_reason, _req, _state) do
    :ok
  end
end
