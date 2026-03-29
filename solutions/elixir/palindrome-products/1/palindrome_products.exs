defmodule Palindromes do
  @doc """
  Generates all palindrome products from an optionally given min factor (or 1) to a given max factor.
  """
  @spec generate(non_neg_integer, non_neg_integer) :: map
  def generate(max_factor, min_factor \\ 1) do
    range = min_factor..max_factor

    palendrome_map =
      for a <- range,
          b <- range,
          p = a*b,
          r = (Integer.digits(p) |> Enum.reverse() |> Integer.undigits()),
          p == r
      do
        [a,b]
      end
      |> Enum.reduce(%{}, fn [a,b], map ->
        factors =
          if a <= b do
            [a,b]
          else
            [b,a]
          end

        product = a*b

        Map.update(map, product, [factors], &(if factors not in &1, do: [factors | &1], else: &1))
      end)

    {min_palendrome, max_palendrome} =
      palendrome_map
      |> Map.keys()
      |> Enum.sort()
      |> Enum.min_max()

    %{}
    |> Map.put(min_palendrome, palendrome_map[min_palendrome])
    |> Map.put(max_palendrome, palendrome_map[max_palendrome])
  end
end
