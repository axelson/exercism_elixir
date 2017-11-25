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

  def do_translate("ch" <> _ = phrase), do: phrase <> "ay"
  def do_translate("qu" <> _ = phrase), do: phrase <> "ay"
  def do_translate("squ" <> _ = phrase), do: phrase <> "ay"
  def do_translate("th" <> _ = phrase), do: phrase <> "ay"
  def do_translate("thr" <> _ = phrase), do: phrase <> "ay"
  def do_translate("sch" <> _ = phrase), do: phrase <> "ay"

  def do_translate("a" <> _ = phrase), do: phrase <> "ay"
  def do_translate("e" <> _ = phrase), do: phrase <> "ay"
  def do_translate("i" <> _ = phrase), do: phrase <> "ay"
  def do_translate("o" <> _ = phrase), do: phrase <> "ay"
  def do_translate("u" <> _ = phrase), do: phrase <> "ay"

  def do_translate(phrase) do
    [first_char | rest] = String.graphemes(phrase)
    Enum.join(rest) <> first_char <> "ay"
  end
end

