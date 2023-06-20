defmodule KitchenCalculator do
  def get_volume({_unit, volume}), do: volume

  def to_milliliter({unit, volume}) do
    {:milliliter, ratio(unit) * volume}
  end

  def from_milliliter({from_unit, volume}, to_unit) do
    milliliters = ratio(from_unit) * volume
    {to_unit, milliliters / ratio(to_unit)}
  end

  def convert(volume_pair, to_unit) do
    {:milliliter, milliliters} = to_milliliter(volume_pair)
    from_milliliter({:milliliter, milliliters}, to_unit)
  end

  defp ratio(:milliliter), do: 1
  defp ratio(:cup), do: 240
  defp ratio(:fluid_ounce), do: 30
  defp ratio(:teaspoon), do: 5
  defp ratio(:tablespoon), do: 15
end
