defmodule PigLatin do
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
    do_translate(phrase)
  end

  def do_translate("ch" <> rest), do: rest <> "ch" <> "ay"
  def do_translate("qu" <> rest), do: rest <> "qu" <> "ay"
  def do_translate("squ" <> rest), do: rest <> "squ" <> "ay"
  def do_translate("thr" <> rest), do: rest <> "thr" <> "ay"
  def do_translate("th" <> rest), do: rest <> "th" <> "ay"
  def do_translate("sch" <> rest), do: rest <> "sch" <> "ay"

  def do_translate("a" <> _ = phrase), do: phrase <> "ay"
  def do_translate("e" <> _ = phrase), do: phrase <> "ay"
  def do_translate("i" <> _ = phrase), do: phrase <> "ay"
  def do_translate("o" <> _ = phrase), do: phrase <> "ay"
  def do_translate("u" <> _ = phrase), do: phrase <> "ay"

  def do_translate(phrase) do
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

