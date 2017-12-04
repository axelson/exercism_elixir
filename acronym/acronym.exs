defmodule Acronym do
  @doc """
  Generate an acronym from a string.
  "This is a string" => "TIAS"
  """
  @spec abbreviate(String.t()) :: String.t()
  def abbreviate(string) do
    string
    |> String.split()
    |> Enum.map(&first_character/1)
    # Note: I don't like this here. Probably need to change my
    # &first_character/1 implementation
    |> Kernel.to_string()
    |> String.upcase()
  end

  defp first_character(<<char :: utf8, _rest :: binary>>), do: char
end
