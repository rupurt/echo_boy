defmodule EchoBoy.WebSocket do
  @behaviour :cowboy_websocket

  def init(req, state) do
    {:cowboy_websocket, req, state}
  end

  def terminate(_reason, _req, _state) do
    :ok
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
  # def websocket_info(msg, req, state) do
  def websocket_info({_timeout, _ref, msg}, state) do
    {:reply, {:text, msg}, state}
  end
end
