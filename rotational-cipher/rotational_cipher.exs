defmodule RotationalCipher do
  @num_letters Enum.count(?a..?z)

  @doc """
  Given a plaintext and amount to shift by, return a rotated string.

  Example:
  iex> RotationalCipher.rotate("Attack at dawn", 13)
  "Nggnpx ng qnja"
  """
  @spec rotate(text :: String.t(), shift :: integer) :: String.t()
  def rotate(text, shift) do
    text
    |> String.to_charlist
    |> Enum.map(&(rotate_char(&1, shift)))
    |> Kernel.to_string()
  end

  defp rotate_char(char, shift) when char in ?a..?z do
    rotate_char(char, shift, ?a)
  end
  defp rotate_char(char, shift) when char in ?A..?Z do
    rotate_char(char, shift, ?A)
  end
  defp rotate_char(char, _), do: char
  defp rotate_char(char, shift, base) do
    index = char - base
    new_index = rem(index + shift, @num_letters)
    new_index + base
  end
end

