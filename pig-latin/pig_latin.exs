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

  def do_translate("a" <> _ = phrase), do: phrase <> "ay"
  def do_translate("e" <> _ = phrase), do: phrase <> "ay"
  def do_translate("i" <> _ = phrase), do: phrase <> "ay"
  def do_translate("o" <> _ = phrase), do: phrase <> "ay"
  def do_translate("u" <> _ = phrase), do: phrase <> "ay"
end

