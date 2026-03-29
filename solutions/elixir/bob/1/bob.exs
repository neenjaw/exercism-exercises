defmodule Bob do
  def hey(input) do
    cond do
      is_blank? input -> "Fine. Be that way!"
      is_question?(input) and is_caps?(input) and not just_numbers?(input) -> "Calm down, I know what I'm doing!"
      is_question?(input) -> "Sure."
      is_caps?(input) and not just_numbers?(input) -> "Whoa, chill out!"
      true -> "Whatever."
    end
  end

  defp is_question?(input) do
    String.ends_with?(input, "?")
  end

  defp is_caps?(input) do
    input == String.upcase(input)
  end

  defp is_blank?(input) do
    "" == String.trim(input)
  end

  defp just_numbers?(input) do
    pattern = :binary.compile_pattern([" ", ",", "?", ";", "."])
    String.split(input, pattern, trim: true)
      |> Enum.join()
      |> String.match?(~r/^\d+$/)
  end
end
