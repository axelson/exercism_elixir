defmodule Roman do
  @numerals [
    {"M", 1000},
    {"CM", 900},
    {"D", 500},
    {"CD", 400},
    {"C", 100},
    {"XC", 90},
    {"L", 50},
    {"XL", 40},
    {"X", 10},
    {"IX", 9},
    {"V", 5},
    {"IV", 4},
    {"I", 1}
  ]

  @doc """
  Convert the number to a roman number.
  """
  @spec numerals(pos_integer) :: String.t()
  def numerals(number) do
    numerals_list(abs(number), [])
    |> Enum.reverse()
    |> Enum.join("")
  end

  defp numerals_list(number, letters) when number <= 0, do: letters

  defp numerals_list(number, letters) do
    {roman, val} = numeral(number)
    numerals_list(number - val, [roman | letters])
  end

  @spec numeral(number) :: {String.t(), integer}
  def numeral(number) do
    Enum.find(@numerals, fn {_roman, val} ->
      val <= number
    end)
  end
end
