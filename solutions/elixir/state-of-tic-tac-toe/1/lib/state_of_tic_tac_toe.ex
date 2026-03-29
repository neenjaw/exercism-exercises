defmodule StateOfTicTacToe do
  @doc """
  Determine the state a game of tic-tac-toe where X starts.
  """
  @spec game_state(board :: String.t()) :: {:ok, :win | :ongoing | :draw} | {:error, String.t()}
  def game_state(board) do
    tokens =
      board
      |> String.split("\n", trim: true)
      |> Enum.flat_map(&to_charlist/1)

    is_x_win = win?(?X, tokens)
    is_o_win = win?(?O, tokens)

    x_count = Enum.count(tokens, &(?X === &1))
    o_count = Enum.count(tokens, &(?O === &1))

    cond do
      x_count === (o_count + 2) ->
        {:error, "Wrong turn order: X went twice"}

      o_count > x_count ->
        {:error, "Wrong turn order: O started"}

      is_x_win and is_o_win ->
        {:error, "Impossible board: game should have ended after the game was won"}

      is_x_win or is_o_win ->
        {:ok, :win}

      x_count + o_count === 9 ->
        {:ok, :draw}

      true ->
        {:ok, :ongoing}
    end
  end

  defp win?(t, [t, t, t, _, _, _, _, _, _]), do: true
  defp win?(t, [_, _, _, t, t, t, _, _, _]), do: true
  defp win?(t, [_, _, _, _, _, _, t, t, t]), do: true
  defp win?(t, [t, _, _, t, _, _, t, _, _]), do: true
  defp win?(t, [_, t, _, _, t, _, _, t, _]), do: true
  defp win?(t, [_, _, t, _, _, t, _, _, t]), do: true
  defp win?(t, [t, _, _, _, t, _, _, _, t]), do: true
  defp win?(t, [_, _, t, _, t, _, t, _, _]), do: true
  defp win?(_, _), do: false
end
