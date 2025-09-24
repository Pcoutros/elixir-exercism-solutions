defmodule BirdCount do
  
  def today([]), do: nil
  
  def today(list) do
    hd(list)
  end

  def increment_day_count([_head | tail] = list) do
    [today(list) + 1 | tail]
  end

  def increment_day_count([]), do: [1]

  def has_day_without_birds?([]), do: false

  def has_day_without_birds?([head | tail]) when head !== 0 do
    has_day_without_birds?(tail)
  end

  def has_day_without_birds?([head | _tail]) when head == 0, do: true

  def total([]), do: 0

  def total([head | tail]) do
    head + total(tail)
  end

  #def total(list) do
  #  Enum.reduce(list, 0, &(&1+&2))
  #end

  def busy_days([]), do: 0

  def busy_days([head | tail]) when head >= 5 do
    1 + busy_days(tail)
  end

  def busy_days([head | tail]) when head < 5 do
    0 + busy_days(tail)
  end

  #def busy_days(list) do
  #  Enum.count(list, &(&1 >= 5))
  #end
end
