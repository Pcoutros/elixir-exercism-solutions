defmodule KitchenCalculator do
  def get_volume(volume_pair) do
    elem(volume_pair, 1)
  end

  def to_milliliter(volume_pair = {:milliliter, _}) do
    {:milliliter, get_volume(volume_pair)}
  end
  
  def to_milliliter(volume_pair = {:cup, _}) do
    {:milliliter, get_volume(volume_pair) * 240}
  end

  def to_milliliter(volume_pair = {:fluid_ounce, _}) do
    {:milliliter, get_volume(volume_pair) * 30}
  end

  def to_milliliter(volume_pair = {:teaspoon, _}) do
    {:milliliter, get_volume(volume_pair) * 5}
  end

  def to_milliliter(volume_pair = {:tablespoon, _}) do
    {:milliliter, get_volume(volume_pair) * 15}
  end

  def from_milliliter(volume_pair, unit = :cup) do
    {unit, get_volume(volume_pair)/240}
  end

  def from_milliliter(volume_pair, unit = :milliliter) do
    {unit, get_volume(volume_pair)}
  end

  def from_milliliter(volume_pair, unit = :fluid_ounce) do
    {unit, get_volume(volume_pair)/30}
  end

  def from_milliliter(volume_pair, unit = :teaspoon) do
    {unit, get_volume(volume_pair)/5}
  end

  def from_milliliter(volume_pair, unit = :tablespoon) do
    {unit, get_volume(volume_pair)/15}
  end

  def convert(volume_pair, unit) do
    {:milliliter, milliliters} = to_milliliter(volume_pair)
    from_milliliter({:milliliter, milliliters}, unit)
  end
end
