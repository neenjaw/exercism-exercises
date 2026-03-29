defmodule Darts do
  @type position :: {number, number}

  @outer_radius 10
  @middle_radius 5
  @inner_radius 1

  @doc """
  Calculate the score of a single dart hitting a target
  """
  @spec score(position :: position) :: integer
  def score({x, y}) do
    distance = :math.sqrt(:math.pow(x, 2) + :math.pow(y, 2))

    cond do
      distance <= @inner_radius -> 10
      distance <= @middle_radius -> 5
      distance <= @outer_radius -> 1
      true -> 0
    end
  end
end
