defmodule StringSeries do
  @doc """
  Given a string `s` and a positive integer `size`, return all substrings
  of that size. If `size` is greater than the length of `s`, or less than 1,
  return an empty list.
  """
  @spec slices(s :: String.t(), size :: integer) :: list(String.t())
  def slices(_s, size) when size <= 0, do: []
  def slices(string, size) when is_binary(string),
    do: slices(String.graphemes(string), size)
  def slices(graphemes, size) when length(graphemes) < size, do: []
  def slices(graphemes, size) do
    {_, rest} = Enum.split(graphemes, 1)
    slice =
      graphemes
      |> Enum.take(size)
      |> Enum.join("")
    [slice | slices(rest, size)]
  end
end

