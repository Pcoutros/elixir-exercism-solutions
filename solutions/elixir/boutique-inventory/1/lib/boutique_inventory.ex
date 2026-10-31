defmodule BoutiqueInventory do
  def sort_by_price(inventory) do
    inventory
    |> Enum.sort_by(&(&1.price))
  end

  def with_missing_price(inventory) do
    inventory
    |> Enum.reject(&(&1.price != nil))
  end

  def update_names(inventory, old_word, new_word) do
      inventory
      |> Enum.map(fn item -> 
        %{item | name: String.replace(item.name, old_word, new_word)} 
      end)
  end

  def increase_quantity(item, count) do
    item 
    |> Map.update(:quantity_by_size, "", fn quantities ->
      Map.new(quantities, fn {size, value} -> {size, value + count} end)
    end)
  end

  def total_quantity(item) do
    item
    |> Map.get(:quantity_by_size)
    |> Map.to_list()
    |> Enum.reduce(0, fn {_size, value}, acc -> acc + value end)
  end
end
