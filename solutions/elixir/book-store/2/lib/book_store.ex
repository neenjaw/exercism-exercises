defmodule BookStore do
  @typedoc "A book is represented by its number in the 5-book series"
  @type book :: 1 | 2 | 3 | 4 | 5

  @regular_price_cents 800
  @discount_5_percent_off_cents 760
  @discount_10_percent_off_cents 720
  @discount_20_percent_off_cents 640
  @discount_25_percent_off_cents 600

  @doc """
  Calculate lowest price (in cents) for a shopping basket containing books.
  """
  @spec total(basket :: [book]) :: integer
  def total(basket) do
    basket
    |> Enum.frequencies()
    |> Enum.sort_by(&elem(&1, 1), :desc)
    |> do_total()
  end

  def do_total(book_counts, sum \\ 0)

  def do_total([], sum), do: sum

  def do_total(book_counts, sum) do
    5..1
    |> Enum.map(fn
      n when n <= length(book_counts) ->
        next_sum = add_discounted_price(n, sum)

        book_counts
        |> drop_discounted_books(n)
        |> do_total(next_sum)

      _ ->
        nil
    end)
    |> Enum.reject(&Kernel.is_nil/1)
    |> Enum.min(fn -> nil end)
  end

  defp add_discounted_price(5, sum), do: 5 * @discount_25_percent_off_cents + sum
  defp add_discounted_price(4, sum), do: 4 * @discount_20_percent_off_cents + sum
  defp add_discounted_price(3, sum), do: 3 * @discount_10_percent_off_cents + sum
  defp add_discounted_price(2, sum), do: 2 * @discount_5_percent_off_cents + sum
  defp add_discounted_price(1, sum), do: @regular_price_cents + sum

  defp drop_discounted_books(book_counts, n_to_drop) do
    book_counts
    |> Enum.with_index()
    |> Enum.map(fn
      {{book, count}, i} when i < n_to_drop -> {book, count - 1}
      {book_count, _} -> book_count
    end)
    |> Enum.reject(fn
      {_, 0} -> true
      _ -> false
    end)
  end
end
