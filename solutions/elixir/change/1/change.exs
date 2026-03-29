defmodule Change do
  @doc """
    Determine the least number of coins to be given to the user such
    that the sum of the coins' value would equal the correct amount of change.
    It returns {:error, "cannot change"} if it is not possible to compute the
    right amount of coins. Otherwise returns the tuple {:ok, list_of_coins}

    ## Examples

      iex> Change.generate([5, 10, 15], 3)
      {:error, "cannot change"}

      iex> Change.generate([1, 5, 10], 18)
      {:ok, [1, 1, 1, 5, 10]}

  """

  @spec generate(list, integer) :: {:ok, list} | {:error, String.t()}
  def generate(_, target) when target < 0, do: {:error, "cannot change"}
  def generate(_, 0), do: {:ok, []}
  def generate(coins, target) do
    coins
    |> Enum.sort(&(&1 >= &2))
    |> sub_generate(target)
    |> case do
      :error -> {:error, "cannot change"}
      coin_list -> {:ok, coin_list}
    end
  end

  def sub_generate(coins, target, acc \\ [])
  def sub_generate([], x, _) when x > 0, do: :error
  def sub_generate(_, 0, acc), do: acc

  def sub_generate([coin|next_coins], target, acc) when coin > target, do: sub_generate(next_coins, target, acc)
  def sub_generate([coin|next_coins] = coins, target, acc) when coin <= target do
    same_coin_branch = sub_generate(coins, target-coin, [coin | acc])
    diff_coin_branch = sub_generate(next_coins, target, acc)

    case {same_coin_branch, diff_coin_branch} do
      {:error, :error}                               -> :error
      {:error, diff}  when is_list(diff)             -> diff
      {same, :error}  when is_list(same)             -> same
      {same, diff} when length(same) <= length(diff)  -> same
      {same, diff} when length(same) > length(diff) -> diff
    end
  end
end
