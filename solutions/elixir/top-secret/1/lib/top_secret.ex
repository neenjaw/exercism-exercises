defmodule TopSecret do
  def to_ast(string), do: Code.string_to_quoted!(string)

  def decode_secret_message_part({fx, _, [arg | _]} = ast, acc) when fx in ~w[def defp]a do
    {ast, [do_decode_fx(arg) | acc]}
  end

  def decode_secret_message_part(ast, acc), do: {ast, acc}

  defp do_decode_fx({:when, _, [fx | _]}), do: do_decode_fx(fx)

  defp do_decode_fx({name, _, args}) when is_list(args) do
    name 
    |> Atom.to_string() 
    |> String.split_at(length(args)) 
    |> elem(0)
  end

  defp do_decode_fx(_), do: ""

  def decode_secret_message(string) do
    string
    |> to_ast
    |> Macro.prewalk([], &decode_secret_message_part/2)
    |> elem(1)
    |> Enum.reverse()
    |> Enum.join("")
  end
end
