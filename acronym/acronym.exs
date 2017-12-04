defmodule Acronym do
  @doc """
  Generate an acronym from a string.
  "This is a string" => "TIAS"
  """
  @spec abbreviate(String.t()) :: String.t()
  def abbreviate(string) do
    string
    |> String.split()
    |> Enum.map(fn word ->
      {char, rest} = String.split_at(word, 1)
      String.upcase(char) <> uppercase_letters(rest)
    end)
    |> Enum.join()
  end

  defp uppercase_letters(word) do
    Regex.scan(~r/[[:upper:]]/, word)
    |> Enum.join()
  end
end
