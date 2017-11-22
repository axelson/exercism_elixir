defmodule SecretHandshake do
  @moduledoc """
  This is implementation uses an attribute as the data for what to execute
  """

  use Bitwise

  @ops [
    {0b00001, {:add, "wink"}},
    {0b00010, {:add, "double blink"}},
    {0b00100, {:add, "close your eyes"}},
    {0b01000, {:add, "jump"}},
    {0b10000, {:reverse}},
  ]

  @doc """
  Determine the actions of a secret handshake based on the binary
  representation of the given `code`.

  If the following bits are set, include the corresponding action in your list
  of commands, in order from lowest to highest.

  1 = wink
  10 = double blink
  100 = close your eyes
  1000 = jump
  10000 = Reverse the order of the operations in the secret handshake
  """
  @spec commands(code :: integer) :: list(String.t())
  def commands(code) do
    Enum.reduce(@ops, [], fn {mask, operation}, list ->
      if (mask &&& code) > 0, do: op(operation, list), else: list
    end)
  end

  def op({:add, string}, list), do: list ++ [string]
  def op({:reverse}, list), do: Enum.reverse(list)
end
