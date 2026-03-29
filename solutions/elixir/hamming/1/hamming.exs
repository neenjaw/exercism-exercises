defmodule Hamming do
  @doc """
  Returns number of differences between two strands of DNA, known as the Hamming Distance.

  ## Examples

  iex> Hamming.hamming_distance('AAGTCATA', 'TAGCGATC')
  {:ok, 4}
  """
  @spec hamming_distance([char], [char]) :: {:ok, non_neg_integer} | {:error, String.t()}
  def hamming_distance(strand1, strand2), do: process_distance(strand1, strand2)

  defp process_distance(strand1, strand2, acc \\ 0)
  # Base case
  defp process_distance([], [], acc), do: {:ok, acc}
  # Function not defined for character lists of unequal length
  defp process_distance([], _, _acc), do: {:error, "Lists must be the same length"}
  defp process_distance(_, [], _acc), do: {:error, "Lists must be the same length"}
  # Recursive cases
  defp process_distance([n|strand1], [n|strand2], acc), do: process_distance(strand1, strand2, acc)
  defp process_distance([_|strand1], [_|strand2], acc), do: process_distance(strand1, strand2, acc+1)
end
