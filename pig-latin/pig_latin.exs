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

  def append_ay(word), do: word <> "ay"

  # Special consonants
  def translate_word("ch" <> rest), do: rest <> "ch"
  def translate_word("qu" <> rest), do: rest <> "qu"
  def translate_word("squ" <> rest), do: rest <> "squ"
  def translate_word("thr" <> rest), do: rest <> "thr"
  def translate_word("th" <> rest), do: rest <> "th"
  def translate_word("sch" <> rest), do: rest <> "sch"

  # Special vowels
  def translate_word("yt" <> _ = phrase), do: phrase
  def translate_word("xr" <> _ = phrase), do: phrase

  def translate_word(<<first_char::binary-size(1), rest::binary>>, consonants \\ "") do
    case vowel?(first_char) do
      true -> first_char <> rest <> consonants
      false -> translate_word(rest, consonants <> first_char)
    end
  end

  def vowel?("a"), do: true
  def vowel?("e"), do: true
  def vowel?("i"), do: true
  def vowel?("o"), do: true
  def vowel?("u"), do: true
  def vowel?(_), do: false
end
