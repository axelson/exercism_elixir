defmodule RunLengthEncoder do
  @doc """
  Generates a string where consecutive elements are represented as a data value
  and collapse.

  "AABBBCCCC" => "2A3B4C"

  For this example, assume all input are strings, that are all uppercase
  letters. It should also be able to reconstruct the data into its original
  form.

  "2A3B4C" => "AABBBCCCC"
  """
  @spec encode(String.t) :: String.t
  def encode(string) do
    string
    |> String.graphemes()
    |> Enum.chunk_by(& &1)
    |> Enum.map(&collapse/1)
    |> Enum.join()
  end

  @spec decode(String.t) :: String.t
  def decode(string) do
    string
    |> expand()
    |> Enum.join()
  end

  defp collapse([character]), do: character
  defp collapse([character | _] = list) do
    "#{length(list)}#{character}"
  end

  defp expand(""), do: []
  defp expand(string) do
    case Integer.parse(string) do
      :error ->
        # String starts with non-digit
        {char, rest} = String.next_grapheme(string)
        [char | expand(rest)]
      {num, rest} ->
        {char, rest} = String.next_grapheme(rest)
        [repeat_char(num, char) | expand(rest)]
    end
  end

  defp repeat_char(num, char) do
    (for _ <- 1..num, do: char)
    |> Enum.join
  end
end
