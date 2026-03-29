defmodule FoodChain do
  @rhymes [
    fly: "I don't know why she swallowed the fly. Perhaps she'll die.",
    spider: "It wriggled and jiggled and tickled inside her.",
    bird: "How absurd to swallow a bird!",
    cat: "Imagine that, to swallow a cat!",
    dog: "What a hog, to swallow a dog!",
    goat: "Just opened her throat and swallowed a goat!",
    cow: "I don't know how she swallowed a cow!",
    horse: "She's dead, of course!"
  ]

  @rhyme_index Map.new(@rhymes)

  @doc """
  Generate consecutive verses of the song 'I Know an Old Lady Who Swallowed a Fly'.
  """
  @spec recite(start :: integer, stop :: integer) :: String.t()
  def recite(start, stop) do
    start..stop
    |> Enum.map(&verse/1)
    |> Enum.join("\n")
  end

  defp verse(1) do
    """
    I know an old lady who swallowed a fly.
    I don't know why she swallowed the fly. Perhaps she'll die.
    """
  end

  defp verse(8) do
    """
    I know an old lady who swallowed a horse.
    She's dead, of course!
    """
  end

  defp verse(n) do
    [{first_animal, first_rhyme} | _] = rhymes = @rhymes |> Enum.take(n) |> Enum.reverse()
    animals = rhymes |> Enum.map(&elem(&1, 0))
    offset_animals = animals |> tl()

    middle_rhymes =
      animals
      |> Enum.zip(offset_animals)
      |> Enum.map(fn
        {:bird, :spider} ->
          "She swallowed the bird to catch the spider that wriggled and jiggled and tickled inside her."
        {animal, prev_animal} ->
          "She swallowed the #{animal} to catch the #{prev_animal}."
      end)
      |> Enum.join("\n")

    """
    I know an old lady who swallowed a #{first_animal}.
    #{first_rhyme}
    #{middle_rhymes}
    I don't know why she swallowed the fly. Perhaps she'll die.
    """
  end
end
