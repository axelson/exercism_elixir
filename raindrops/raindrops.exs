defmodule Raindrops do
  @doc """
  Returns a string based on raindrop factors.

  - If the number contains 3 as a prime factor, output 'Pling'.
  - If the number contains 5 as a prime factor, output 'Plang'.
  - If the number contains 7 as a prime factor, output 'Plong'.
  - If the number does not contain 3, 5, or 7 as a prime factor,
    just pass the number's digits straight through.
  """
  @spec convert(pos_integer) :: String.t
  def convert(number) do
    case {rem(number, 3), rem(number, 5), rem(number, 7)} do
      {0, 0, 0} -> "PlingPlangPlong"
      {0, 0, _} -> "PlingPlang"
      {0, _, 0} -> "PlingPlong"
      {0, _, _} -> "Pling"
      {_, 0, 0} -> "PlangPlong"
      {_, 0, _} -> "Plang"
      {_, _, 0} -> "Plong"
      {_, _, _} -> to_string(number)
    end
  end
end
