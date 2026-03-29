defmodule ResistorColorTrio do
  @colors ~w[black brown red orange yellow green blue violet grey white]a
  @color_values @colors |> Enum.with_index() |> Map.new

  @doc """
  Calculate the resistance value in ohm or kiloohm from resistor colors
  """
  @spec label(colors :: [atom]) :: {integer, :ohms | :kiloohms}
  def label(colors) do
    [v1, v2, places] = colors |> Enum.take(3) |> Enum.map(&@color_values[&1])
    ohms = (v1 * 10 + v2) * Integer.pow(10, places)

    cond do
      ohms >= 1000 -> {div(ohms, 1000), :kiloohms}
      true -> {ohms, :ohms}
    end
  end
end
