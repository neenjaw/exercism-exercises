defmodule StringSeries do
  @doc """
  Given a string `s` and a positive integer `size`, return all substrings
  of that size. If `size` is greater than the length of `s`, or less than 1,
  return an empty list.
  """
  @spec slices(s :: String.t(), size :: integer) :: list(String.t())
  def slices(s, size) do
    cond do
      size <= 0 -> []
      size > String.length(s) -> []
      size == String.length(s) -> [s]
      true -> String.slice(s, 1, String.length(s)) 
        |> slices(size)
        |> (fn acc -> [String.slice(s, 0, size) | acc] end).()
    end
  end
end
