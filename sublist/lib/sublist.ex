defmodule Sublist do
  @moduledoc """
  Compare lists using the Knuth-Morris-Pratt algorithm
  https://en.wikipedia.org/wiki/Knuth-Morris-Pratt_algorithm
  """

  @doc """
  Returns whether the first list is a sublist or a superlist of the second list
  and if not whether it is equal or unequal to the second list.
  """
  def compare(a, a), do: :equal
  def compare(str_a, str_b) when is_binary(str_a) and is_binary(str_b) do
    cond do
      String.contains?(str_b, str_a) -> :sublist
      String.contains?(str_a, str_b) -> :superlist
      true -> :unequal
    end
  end
  def compare(a, b) do
    # http://www.inf.fh-flensburg.de/lang/algorithmen/pattern/kmpen.htm 
    # https://www.ics.uci.edu/~eppstein/161/960227.html
    # http://www.geeksforgeeks.org/searching-for-patterns-set-2-kmp-algorithm/

    {str_a, str_b} = {to_string(a), to_string(b)}
    compare(str_a, str_b)
  end

  # A  B  C  D  A  B  D
  # -1 0  0  0  -1 0  2
  @doc """
  Build the "Partial Match" table
  """
  def build_table(list) do
    reversed = Enum.reverse(list)
    calc_table_val(reversed, tl(list))


    Enum.reduce(list, %{}, fn elem ->
    end)

    for i <- 0..(length(list) - 1) do
      
    end
  end

  def calc_table_val(reversed, list) do

  end
end

# defmodule Test do
#   use ExUnit
#   def one do
#     assert Sublist.build_table(~w[A B C D A B D]) == %{
#       0 => -1,
#       1 => 0,
#       2 => 0,
#       3 => 0,
#       4 => -1,
#       5 => 0,
#       6 => 2,
#     }
#   end
# end
