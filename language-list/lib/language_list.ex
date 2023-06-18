defmodule LanguageList do
  def new, do: []

  def add(list, language) do
    [language | list]
  end

  def remove([_ | rest]), do: rest

  def first([first | _rest]), do: first

  def count([]), do: 0
  def count([_ | rest]), do: 1 + count(rest)

  def functional_list?([]), do: false
  def functional_list?(["Elixir" | _]), do: true
  def functional_list?([_ | rest]), do: functional_list?(rest)
end
