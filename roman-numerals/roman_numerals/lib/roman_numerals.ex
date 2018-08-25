defmodule Roman do
  @doc """
  Convert the number to a roman number.
  """
  @spec numerals(pos_integer) :: String.t()
  def numerals(number) do
    case numeral(number) do
      {letters, 0} ->
        letters

      {letters, remaining} ->
        letters <> numerals(remaining)
    end
  end

  @spec numeral(number) :: String.t() | {String.t(), integer}
  def numeral(n) when n >= 1000, do: {"M", n - 1000}

  def numeral(n) when n >= 900, do: {"CM", n - 900}

  def numeral(n) when n >= 500, do: {"D", n - 500}

  def numeral(n) when n >= 400, do: {"CD", n - 400}

  def numeral(n) when n >= 100, do: {"C", n - 100}

  def numeral(n) when n >= 90, do: {"XC", n - 90}

  def numeral(n) when n >= 50, do: {"L", n - 50}

  def numeral(n) when n >= 40, do: {"XL", n - 40}

  def numeral(n) when n >= 10, do: {"X", n - 10}

  def numeral(n) when n >= 9, do: {"IX", n - 9}

  def numeral(n) when n >= 5, do: {"V", n - 5}

  def numeral(n) when n >= 4, do: {"IV", n - 4}

  def numeral(n) when n >= 1, do: {"I", n - 1}
end
