defmodule ResistorColorDuo do
  @colors ~w[black brown red orange yellow green blue violet grey white]a
  @color_values @colors |> Enum.with_index() |> Map.new

  @doc """
  Calculate a resistance value from two colors
  """
  @spec value(colors :: [atom]) :: integer
  def value(colors) when length(colors) >= 2 do
    [v1, v2] =
      colors
      |> Enum.take(2)
      |> Enum.map(&@color_values[&1])

    v1 * 10 + v2
  end
end
