defmodule CaptainsLog do
  @planetary_classes ["D", "H", "J", "K", "L", "M", "N", "R", "T", "Y"]

  def random_planet_class() do
    Enum.random(@planetary_classes)
  end

  def random_ship_registry_number() do
    "NCC-#{Enum.random(1000..9999)}" 
  end

  def random_stardate() do
    41000.0 + :rand.uniform() * 1000
  end

  def format_stardate(stardate) when is_integer(stardate), do: raise ArgumentError
  def format_stardate(stardate) do
    stardate |> Float.round(1) |> Float.to_string()
  end
end
