defmodule StringSeries do
  @doc """
  Given a string `s` and a positive integer `size`, return all substrings
  of that size. If `size` is greater than the length of `s`, or less than 1,
  return an empty list.
  """
  @spec slices(s :: String.t(), size :: integer) :: list(String.t())
  def slices(_s, size) when size <= 0, do: []
  def slices(string, size) do
    {_, rest} = String.split_at(string, 1)
    {slice, _} = String.split_at(string, size)

    cond do
      String.length(slice) < size -> []
      String.length(rest) >= size -> [slice | slices(rest, size)]
      true -> [slice]
    end
  end
end

