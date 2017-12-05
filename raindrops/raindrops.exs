defmodule Raindrops do
  @doc """
  Returns a string based on raindrop factors.

  - If the number contains 3 as a prime factor, output 'Pling'.
  - If the number contains 5 as a prime factor, output 'Plang'.
  - If the number contains 7 as a prime factor, output 'Plong'.
  - If the number does not contain 3, 5, or 7 as a prime factor,
    just pass the number's digits straight through.
  """
  @spec convert(pos_integer) :: String.t
  def convert(number) do
    ""
    |> maybe_pling(number)
    |> maybe_plang(number)
    |> maybe_plong(number)
    |> maybe_number(number)
  end

  defp maybe_pling(string, number) when rem(number, 3) == 0,
    do: string <> "Pling"
  defp maybe_pling(string, _), do: string

  defp maybe_plang(string, number) when rem(number, 5) == 0,
    do: string <> "Plang"
  defp maybe_plang(string, _), do: string

  defp maybe_plong(string, number) when rem(number, 7) == 0,
    do: string <> "Plong"
  defp maybe_plong(string, _), do: string

  defp maybe_number("", number), do: to_string(number)
  defp maybe_number(string, _), do: string
end
