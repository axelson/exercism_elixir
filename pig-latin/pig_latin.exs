defmodule PigLatin do
  @moduledoc """
  This is an initial version that primarily uses binary pattern matching. I
  would like to generalize the implementation a bit. Right now translate_word/1
  is a bit redundant with vowel?/1
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
    |> Enum.join(" ")
  end

  def translate_word("ch" <> rest), do: rest <> "ch" <> "ay"
  def translate_word("qu" <> rest), do: rest <> "qu" <> "ay"
  def translate_word("squ" <> rest), do: rest <> "squ" <> "ay"
  def translate_word("thr" <> rest), do: rest <> "thr" <> "ay"
  def translate_word("th" <> rest), do: rest <> "th" <> "ay"
  def translate_word("sch" <> rest), do: rest <> "sch" <> "ay"

  def translate_word("a" <> _ = phrase), do: phrase <> "ay"
  def translate_word("e" <> _ = phrase), do: phrase <> "ay"
  def translate_word("i" <> _ = phrase), do: phrase <> "ay"
  def translate_word("o" <> _ = phrase), do: phrase <> "ay"
  def translate_word("u" <> _ = phrase), do: phrase <> "ay"
  def translate_word("yt" <> _ = phrase), do: phrase <> "ay"
  def translate_word("xr" <> _ = phrase), do: phrase <> "ay"

  def translate_word(phrase) do
    shift_consonants(phrase) <> "ay"
  end

  def shift_consonants(<<first_char::binary-size(1), rest::binary>>, consonants \\ "") do
    if vowel?(first_char) do
      first_char <> rest <> consonants
    else
      shift_consonants(rest, consonants <> first_char)
    end
  end

  def vowel?("a"), do: true
  def vowel?("e"), do: true
  def vowel?("i"), do: true
  def vowel?("o"), do: true
  def vowel?("u"), do: true
  def vowel?(_), do: false
end
