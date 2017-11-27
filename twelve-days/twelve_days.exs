defmodule TwelveDays do

  @verses %{
    12 => "twelve Drummers Drumming",
    11 => "eleven Pipers Piping",
    10 => "ten Lords-a-Leaping",
    9 => "nine Ladies Dancing",
    8 => "eight Maids-a-Milking",
    7 => "seven Swans-a-Swimming",
    6 => "six Geese-a-Laying",
    5 => "five Gold Rings",
    4 => "our Calling Birds",
    3 => "three French Hens",
    2 => "two Turtle Doves",
    1 => "a Partridge in a Pear Tree",
  }

  @numbers %{
    1 => "first",
    2 => "second",
    3 => "third",
    4 => "fourth",
    5 => "fifth",
    6 => "sixth",
    7 => "seventh",
    8 => "eigth",
    9 => "ninth",
    10 => "tenth",
    11 => "eleventh",
    12 => "twelfth",
  }

  @doc """
  Given a `number`, return the song's verse for that specific day, including
  all gifts for previous days in the same line.
  """
  @spec verse(number :: integer) :: String.t()
  def verse(number) do
    intro = "On the #{long_number(number)} day of Christmas my true love gave to me,"

    verses = number..1
    |> Enum.map(&line/1)
    |> Enum.join(", ")

    "#{intro} #{verses}."
  end

  @doc """
  Given a `starting_verse` and an `ending_verse`, return the verses for each
  included day, one per line.
  """
  @spec verses(starting_verse :: integer, ending_verse :: integer) :: String.t()
  def verses(starting_verse, ending_verse) do
  end

  @doc """
  Sing all 12 verses, in order, one verse per line.
  """
  @spec sing():: String.t()
  def sing do
  end

  defp line(number) do
    @verses[number]
  end

  defp long_number(number) do
    @numbers[number]
  end
end

