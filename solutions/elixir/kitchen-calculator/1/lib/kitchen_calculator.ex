defmodule KitchenCalculator do
  def get_volume({_, volume}), do: volume

  @milliliter_conversion_table [
    {:cup, 240.0},
    {:fluid_ounce, 30.0},
    {:teaspoon, 5.0},
    {:tablespoon, 15.0},
    {:milliliter, 1.0},
  ]

  for {unit, conversion_value} <- @milliliter_conversion_table do
    def to_milliliter({unquote(unit), volume}), do: {:milliliter, volume * unquote(conversion_value)}  
  end

  for {unit, conversion_value} <- @milliliter_conversion_table do
    def from_milliliter({:milliliter, volume}, unquote(unit)), do: {unquote(unit), volume / unquote(conversion_value)}  
  end

  def convert(volume_pair, unit) do
    volume_pair |> to_milliliter() |> from_milliliter(unit)
  end
end
