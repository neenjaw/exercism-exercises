defmodule AffineCipher do
  @typedoc """
  A type for the encryption key
  """
  @type key() :: %{a: integer, b: integer}

  @chunk_length 5
  @length_of_alphabet ?z - ?a + 1

  @doc """
  Encode an encrypted message using a key
  """
  @spec encode(key :: key(), message :: String.t()) :: {:ok, String.t()} | {:error, String.t()}
  def encode(%{a: a, b: _} = key, message) do
    with key <- Map.put(key, :m, @length_of_alphabet),
        true <- is_coprime(a, key.m) do
      {:ok, do_encode(key, message)}
    else
      _ -> {:error, "a and m must be coprime."}
    end
  end

  defp do_encode(%{a: a, b: b, m: m}, message) do
    message
    |> String.downcase()
    |> to_charlist()
    |> Stream.filter(&filter_chars/1)
    |> Stream.map(&encode_char(&1, a, b, m))
    |> Stream.chunk_every(@chunk_length)
    |> Stream.intersperse(?\s)
    |> Enum.to_list()
    |> to_string()
  end

  defp encode_char(char, _a, _b, _m) when char in ?0..?9, do: char
  defp encode_char(char, a, b, m) do
    char = char - ?a
    char = rem((a * char + b), m)
    char + ?a
  end

  @doc """
  Decode an encrypted message using a key
  """
  @spec decode(key :: key(), message :: String.t()) :: {:ok, String.t()} | {:error, String.t()}
  def decode(%{a: a, b: _} = key, encrypted) do
    with key <- Map.put(key, :m, @length_of_alphabet),
        true <- is_coprime(a, key.m),
        key <- Map.put(key, :mmi, find_mmi(a, key.m)) do
      {:ok, do_decode(key, encrypted)}
    else
      _ -> {:error, "a and m must be coprime."}
    end
  end

  def do_decode(%{a: _a, b: b, mmi: mmi, m: m}, encrypted) do
    encrypted
    |> to_charlist()
    |> Stream.filter(&filter_chars/1)
    |> Stream.map(&decode_char(&1, mmi, b, m))
    |> Enum.to_list()
    |> to_string()
  end

  defp decode_char(char, _mmi, _b, _m) when char in ?0..?9, do: char
  defp decode_char(char, mmi, b, m) do
    char = char - ?a
    char = Integer.mod(mmi * (char - b), m)
    char + ?a
  end

  defp filter_chars(char) when char in ?a..?z, do: true
  defp filter_chars(char) when char in ?0..?9, do: true
  defp filter_chars(_char), do: false

  defp is_coprime(a, m), do: Integer.gcd(a, m) == 1

  defp find_mmi(a, m) do
    {1, x, _} = Integer.extended_gcd(a, m)

    if x < 0 do
      x + m
    else
      x
    end
  end
end
