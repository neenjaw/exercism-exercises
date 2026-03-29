defmodule BoutiqueInventory do
  def sort_by_price(inventory) do
    inventory
    |> Enum.sort_by(fn item -> item.price end, :asc)
  end

  def with_missing_price(inventory) do
    inventory
    |> Enum.filter(&(&1.price |> is_nil()))
  end

  def increase_quantity(item, count) do
    updated =
      item.quantity_by_size
      |> Enum.map(fn {size, qty} -> {size, qty + count} end)
      |> Map.new()

    %{ item | quantity_by_size: updated }
  end

  def total_quantity(item) do
    updated =
      item.quantity_by_size
      |> Enum.map(fn {size, qty} -> qty end)
      |> Enum.sum()
  end
end
