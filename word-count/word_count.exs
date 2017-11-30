defmodule Words do
  @doc """
  Count the number of words in the sentence.

  Words are compared case-insensitively.
  """
  @spec count(String.t) :: map
  def count(sentence) do
    sentence
    |> String.replace(~r/[^\p{Xan}\p{Xsp}-]/u, " ")
    |> String.downcase()
    |> String.split()
    |> count_words()
  end

  def count_words(words, counts \\ %{})
  def count_words([], counts), do: counts
  def count_words([word | rest], counts) do
    new_counts = Map.update(counts, word, 1, &(&1 + 1))
    count_words(rest, new_counts)
  end
end
