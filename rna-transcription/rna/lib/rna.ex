defmodule RNATranscription do
  @doc """
  Transcribes a character list representing DNA nucleotides to RNA

  ## Examples

  iex> RNATranscription.to_rna('ACTG')
  'UGAC'
  """
  @spec to_rna([char]) :: [char]
  def to_rna(dna) do
    Enum.map(dna, &translate_strand/1)
  end

  defp translate_strand(?G), do: ?C
  defp translate_strand(?C), do: ?G
  defp translate_strand(?T), do: ?A
  defp translate_strand(?A), do: ?U
end

