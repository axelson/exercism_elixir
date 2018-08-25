defmodule Roman do
  @values [
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
    case numeral(number) do
      {letters, 0} -> letters
      {letters, remaining} -> letters <> numerals(remaining)
    end
  end

  @spec numeral(number) :: {String.t(), integer}
  for {letter, value} <- @values do
    def numeral(n) when n >= unquote(value) do
      {unquote(letter), n - unquote(value)}
    end
  end
end
