defmodule NucleotideCount do
  @nucleotides [?A, ?C, ?G, ?T]
  @counts Enum.reduce(@nucleotides, %{}, fn nucleotide, counts ->
    Map.put(counts, nucleotide, 0)
  end)

  @doc """
  Counts individual nucleotides in a NucleotideCount strand.

  ## Examples

  iex> NucleotideCount.count('AATAA', ?A)
  4

  iex> NucleotideCount.count('AATAA', ?T)
  1
  """
  @spec count([char], char) :: non_neg_integer
  def count(strand, nucleotide) do
    histogram(strand)[nucleotide]
  end

  @doc """
  Returns a summary of counts by nucleotide.

  ## Examples

  iex> NucleotideCount.histogram('AATAA')
  %{?A => 4, ?T => 1, ?C => 0, ?G => 0}
  """
  @spec histogram([char]) :: map
  def histogram(strand) do
    Enum.reduce(strand, @counts, &count_letter/2)
  end

  defp count_letter(letter, counts) when letter in @nucleotides do
    Map.update!(counts, letter, fn
      current_count -> current_count + 1
    end)
  end
  defp count_letter(_, counts), do: counts
end
