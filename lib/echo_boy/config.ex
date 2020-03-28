defmodule EchoBoy.Config do
  @default_port 4200

  @spec port :: non_neg_integer
  def port do
    Application.get_env(:echo_boy, :port, @default_port)
  end
end
