defmodule LogLevel do
  @log_codes %{
    0 => {:trace, false},
    1 => {:debug, true},
    2 => {:info, true},
    3 => {:warning, true},
    4 => {:error, true},
    5 => {:fatal, false}
  }
  @unknown :unknown

  def to_label(level, legacy?) do
    {label, legacy_supported} = Map.get(@log_codes, level, {@unknown, true})

    cond do
      legacy? && !legacy_supported -> :unknown
      true -> label
    end
  end

  def alert_recipient(level, legacy?) do
    label = to_label(level, legacy?)

    cond do
      label in [:error, :fatal] -> :ops
      label == :unknown && legacy? -> :dev1
      label == :unknown -> :dev2
      true -> false
    end
  end
end
