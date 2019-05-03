defmodule EchoBoy.WebSocket do
  @behaviour :cowboy_websocket

  def init(req, state) do
    {:cowboy_websocket, req, state}
  end

  def websocket_init(state) do
    {:ok, state}
  end

  @doc """
  Close the connection when the handler receives a 'close' message
  """
  def websocket_handle({:text, "close"}, state) do
    {:stop, state}
  end

  @doc """
  Send the payload back to the client for all other messages.
  Don't send a reply for other messages.
  """
  def websocket_handle({:text, message}, state) do
    {:reply, {:text, message}, state}
  end

  @doc """
  Format and forward elixir messages to client
  """
  def websocket_info(info, state) do
    {:reply, {:text, info}, state}
  end

  @doc """
  No matter why we terminate, remove all of this pids subscriptions
  """
  def terminate(_reason, _req, _state) do
    :ok
  end
end
