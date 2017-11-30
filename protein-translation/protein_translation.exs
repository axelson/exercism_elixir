defmodule ProteinTranslation do
  @moduledoc """
  Cleaned up implementation that dynamically defines the of_codon function to
  make full use of pattern matching (and for speed)
  """

  @codons %{
    "UGU" => "Cysteine",
    "UGC" => "Cysteine",
    "UUA" => "Leucine",
    "UUG" => "Leucine",
    "AUG" => "Methionine",
    "UUU" => "Phenylalanine",
    "UUC" => "Phenylalanine",
    "UCU" => "Serine",
    "UCC" => "Serine",
    "UCA" => "Serine",
    "UCG" => "Serine",
    "UGG" => "Tryptophan",
    "UAU" => "Tyrosine",
    "UAC" => "Tyrosine",
    "UAA" => "STOP",
    "UAG" => "STOP",
    "UGA" => "STOP",
  }

  @doc """
  Given an RNA string, return a list of proteins specified by codons, in order.
  """
  @spec of_rna(String.t()) :: { atom,  list(String.t()) }
  def of_rna(rna) do
    proteins = do_of_rna(rna)
    if Enum.any?(proteins, & &1 == "invalid codon") do
      {:error, "invalid RNA"}
    else
      {:ok, proteins}
    end
  end

  defp do_of_rna(""), do: []
  defp do_of_rna(rna) do
    {codon, rest} = String.split_at(rna, 3)

    case of_codon(codon) do
      {:ok, "STOP"} -> []
      {:ok, protein} -> [protein | do_of_rna(rest)]
      {:error, "invalid codon"} -> ["invalid codon"]
    end
  end

  @doc """
  Given a codon, return the corresponding protein

  UGU -> Cysteine
  UGC -> Cysteine
  UUA -> Leucine
  UUG -> Leucine
  AUG -> Methionine
  UUU -> Phenylalanine
  UUC -> Phenylalanine
  UCU -> Serine
  UCC -> Serine
  UCA -> Serine
  UCG -> Serine
  UGG -> Tryptophan
  UAU -> Tyrosine
  UAC -> Tyrosine
  UAA -> STOP
  UAG -> STOP
  UGA -> STOP
  """
  @spec of_codon(String.t()) :: { atom, String.t() }
  Enum.each(@codons, fn {codon, protein} ->
    def of_codon(unquote(codon)) do
      {:ok, unquote(protein)}
    end
  end)
  def of_codon(_), do: {:error, "invalid codon"}
end

