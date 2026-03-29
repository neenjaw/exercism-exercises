defmodule Username do
  @doc """
  Sanitize the charlist

  ä becomes ae
  ö becomes oe
  ü becomes ue
  ß becomes ss
  """
  def sanitize(username) do
    username
    |> Enum.filter(&do_allowed_letters/1)
    |> Enum.map(&do_convert/1)
    |> List.flatten()
  end

  defp do_allowed_letters(char) when char in ?a..?z, do: true
  defp do_allowed_letters(char) when char == ?_, do: true
  defp do_allowed_letters(char) when char in 'äöüß', do: true
  defp do_allowed_letters(_), do: false

  defp do_convert(char) do
    case char do
      ?ä -> 'ae'
      ?ö -> 'oe'
      ?ü -> 'ue'
      ?ß -> 'ss'
      _ -> char
    end
  end
end
