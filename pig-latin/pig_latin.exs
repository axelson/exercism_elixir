defmodule PigLatin do
  @moduledoc """
  Use binary pattern matching as the main driver.
  """

  @doc """
  Given a `phrase`, translate it a word at a time to Pig Latin.

  Words beginning with consonants should have the consonant moved to the end of
  the word, followed by "ay".

  Words beginning with vowels (aeiou) should have "ay" added to the end of the
  word.

  Some groups of letters are treated like consonants, including "ch", "qu",
  "squ", "th", "thr", and "sch".

  Some groups are treated like vowels, including "yt" and "xr".
  """
  @spec translate(phrase :: String.t()) :: String.t()
  def translate(phrase) do
    phrase
    |> String.split()
    |> Enum.map(&translate_word/1)
    |> Enum.map(&append_ay/1)
    |> Enum.join(" ")
  end

  defp append_ay(word), do: word <> "ay"

  # Special consonants
  defp translate_word("ch" <> rest), do: rest <> "ch"
  defp translate_word("qu" <> rest), do: rest <> "qu"
  defp translate_word("squ" <> rest), do: rest <> "squ"
  defp translate_word("thr" <> rest), do: rest <> "thr"
  defp translate_word("th" <> rest), do: rest <> "th"
  defp translate_word("sch" <> rest), do: rest <> "sch"

  # Special vowels
  defp translate_word("yt" <> _ = phrase), do: phrase
  defp translate_word("xr" <> _ = phrase), do: phrase

  defp translate_word("", consonants) do
    consonants
  end

  defp translate_word(<<first_char::binary-size(1), rest::binary>>, consonants \\ "") do
    case vowel?(first_char) do
      true -> first_char <> rest <> consonants
      false -> translate_word(rest, consonants <> first_char)
    end
  end

  defp vowel?("a"), do: true
  defp vowel?("e"), do: true
  defp vowel?("i"), do: true
  defp vowel?("o"), do: true
  defp vowel?("u"), do: true
  defp vowel?(_), do: false
end
