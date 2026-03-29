defmodule VariableLengthQuantity do
  use Bitwise

  @mask_7bits 0b1111111
  defguard is_seven_bits(value) when (value &&& @mask_7bits) == value

  @doc """
  Encode integers into a bitstring of VLQ encoded bytes
  """
  @spec encode(integers :: [integer]) :: binary
  def encode(integers) when is_list(integers) do
    integers
    |> Enum.map(&do_encode/1)
    |> Enum.join(<<>>)
  end

  def do_encode(value, type \\ :first) do
    has_more = if type == :first, do: 0, else: 1

    if is_seven_bits(value) do
      <<has_more::1, value::7>>
    else
      <<do_encode(value >>> 7, :cont)::binary, has_more::1, value::7>>  
    end
  end

  @doc """
  Decode a bitstring of VLQ encoded bytes into a series of integers
  """
  @spec decode(bytes :: binary) :: {:ok, [integer]} | {:error, String.t()}
  def decode(bytes) do
    bytes 
    |> :binary.bin_to_list()
    |> do_decode([]) 
  end

  def do_decode([], acc), do: {:ok, acc |> Enum.reverse()}

  def do_decode(byte_list, acc) do
    case Enum.split_while(byte_list, fn byte -> byte >>> 7 !== 0 end) do
      {first_bytes, [last_value | remaining]} ->
        decoded_value =
          first_bytes
          |> Enum.reduce(0, fn byte, acc ->
            acc = acc <<< 7
            value = byte &&& @mask_7bits
            acc + value
          end)
          |> Bitwise.<<<(7)
          |> Kernel.+(last_value)
        
        do_decode(remaining, [decoded_value | acc])

      _ -> 
        {:error, "incomplete sequence"}
    end
  end
end
