defmodule Sublist do
  @moduledoc """
  Compare lists using the Knuth-Morris-Pratt algorithm
  https://en.wikipedia.org/wiki/Knuth-Morris-Pratt_algorithm
  # http://www.inf.fh-flensburg.de/lang/algorithmen/pattern/kmpen.htm
  # https://www.ics.uci.edu/~eppstein/161/960227.html
  # http://www.geeksforgeeks.org/searching-for-patterns-set-2-kmp-algorithm/
  """

  @doc """
  Returns whether the first list is a sublist or a superlist of the second list
  and if not whether it is equal or unequal to the second list.
  """
  # def compare(a, a), do: :equal

  def compare(list_a, list_b) do
    map_a =
      list_a
      |> Enum.with_index()
      |> Map.new(fn {val, index} -> {index, val} end)

    map_b =
      list_b
      |> Enum.with_index()
      |> Map.new(fn {val, index} -> {index, val} end)

    IO.inspect(map_a, label: "map_a")
    IO.inspect(map_b, label: "map_b")
    size_a = map_size(map_a)
    size_b = map_size(map_b)

    case check(map_a, map_b, 0, 0) do
      :equal -> :equal
      :sublist -> :sublist
      :superlist -> :superlist
      :unequal -> do_compare(map_a, map_b, 0, 1)
    end
  end

  def do_compare(map_a, map_b, index_a, index_b) do
    case check(map_a, map_b, index_a, index_b) do
      :equal -> :sublist
      :sublist -> :sublist
      # Maybe wrong
      :superlist -> :unequal
      :unequal -> do_compare(map_a, map_b, index_a, index_b)
    end
  end

  def check(map_a, map_b, index_a, index_b) do
    case {Map.has_key?(map_a, index_a), Map.has_key?(map_b, index_b)} do
      {true, true} ->
        if Map.get(map_a, index_a) == Map.get(map_b, index_b) do
          check(map_a, map_b, index_a + 1, index_b + 1)
        else
          :unequal
        end

      {false, false} ->
        :equal

      {true, false} ->
        :sublist

      {false, true} ->
        :superlist
    end
  end

  # A  B  C  D  A  B  D
  # -1 0  0  0  -1 0  2
  # @doc """
  # Build the "Partial Match" table
  # """
  # def build_table(list) do
  #   reversed = Enum.reverse(list)
  #   calc_table_val(reversed, tl(list))

  #   Enum.reduce(list, %{}, fn elem ->
  #     nil
  #   end)

  #   for i <- 0..(length(list) - 1) do
  #   end
  # end
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
