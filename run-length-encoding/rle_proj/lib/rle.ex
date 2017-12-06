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
    |> Enum.map(fn ->
      [character] -> character
      [character | _] = list -> length(list) <> character
    end)
    |> Enum.join()
  end

  @spec decode(String.t) :: String.t
  def decode(string) do
    string
    |> expand()
    |> Enum.join()
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
        [String.duplicate(char, num) | expand(rest)]
    end
  end
end
