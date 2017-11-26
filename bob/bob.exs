defmodule Bob do
  def hey(input) do
    last_char = String.last(input)
    trimmed = String.trim(input)
    has_letter = String.match?(input, ~r/\p{L}/u)
    all_upper = String.match?(input, ~r/^(\p{Lu}|[^\p{L}])+$/u)

    cond do
      last_char == "?" -> "Sure."
      trimmed == "" -> "Fine. Be that way!"
      all_upper && has_letter -> "Whoa, chill out!"
      true -> "Whatever."
    end
  end
end
