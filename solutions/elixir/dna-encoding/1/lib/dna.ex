defmodule DNA do
  def encode_nucleotide(?\s), do: 0b0000
  def encode_nucleotide(?A), do: 0b0001
  def encode_nucleotide(?C), do: 0b0010
  def encode_nucleotide(?G), do: 0b0100
  def encode_nucleotide(?T), do: 0b1000

  def decode_nucleotide(0b0000), do: ?\s
  def decode_nucleotide(0b0001), do: ?A
  def decode_nucleotide(0b0010), do: ?C
  def decode_nucleotide(0b0100), do: ?G
  def decode_nucleotide(0b1000), do: ?T

  def encode(dna), do: do_encode(dna, <<>>)

  defp do_encode([], encoded), do: encoded
  defp do_encode([n | rest], encoded), 
    do: do_encode(rest, <<encoded::bitstring, encode_nucleotide(n)::4>>)

  def decode(dna), do: do_decode(dna, [])

  defp do_decode(<<>>, decoded), do: decoded |> Enum.reverse()
  defp do_decode(<<n::4, rest::bitstring>>, decoded),
    do: do_decode(rest, [decode_nucleotide(n) | decoded])
end
