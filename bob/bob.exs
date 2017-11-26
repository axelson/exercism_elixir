defmodule Bob do
  def hey(input) do
    upcased = String.upcase(input)
    downcased = String.downcase(input)

    cond do
      String.ends_with?(input,"?") -> "Sure."
      String.trim(input) == "" -> "Fine. Be that way!"
      upcased == input && downcased != input -> "Whoa, chill out!"
      true -> "Whatever."
    end
  end
end
