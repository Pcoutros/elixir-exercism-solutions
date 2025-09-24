defmodule HighScore do

  @constant_number 0
  
  def new() do
    Map.new
  end

  def add_player(scores, name, score \\ @constant_number) do
    Map.put(scores, name, score)
  end

  def remove_player(scores, name) do
    Map.delete(scores, name)
  end

  def reset_score(scores, name) do
    Map.update(scores, name, @constant_number, fn(_x) -> @constant_number end)
  end

  def update_score(scores, name, score) do
    Map.update(scores, name, score, fn(x) -> x + score end)
  end

  def get_players(scores) do
    Map.keys(scores)
  end
end
