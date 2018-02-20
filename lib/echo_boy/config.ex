defmodule EchoBoy.Config do
  def port do
    Application.get_env(:echo_boy, :port)
  end
end
