defmodule KitchenCalculator do
  def get_volume(volume_pair), do: elem(volume_pair, 1)

  def to_milliliter(volume_pair = {:milliliter, _}), do: {:milliliter, get_volume(volume_pair)}
  def to_milliliter(volume_pair = {:cup, _}), do: {:milliliter, get_volume(volume_pair) * 240}
  def to_milliliter(volume_pair = {:fluid_ounce, _}), do: {:milliliter, get_volume(volume_pair) * 30}
  def to_milliliter(volume_pair = {:teaspoon, _}), do: {:milliliter, get_volume(volume_pair) * 5}
  def to_milliliter(volume_pair = {:tablespoon, _}), do: {:milliliter, get_volume(volume_pair) * 15}
  
  def from_milliliter(volume_pair, unit = :cup), do: {unit, get_volume(volume_pair)/240}
  def from_milliliter(volume_pair, unit = :milliliter), do: {unit, get_volume(volume_pair)}
  def from_milliliter(volume_pair, unit = :fluid_ounce), do: {unit, get_volume(volume_pair)/30}
  def from_milliliter(volume_pair, unit = :teaspoon), do: {unit, get_volume(volume_pair)/5}
  def from_milliliter(volume_pair, unit = :tablespoon), do: {unit, get_volume(volume_pair)/15}

  def convert(volume_pair, unit) do
    volume_pair 
    |> to_milliliter 
    |> from_milliliter(unit)
  end
end
