defmodule Yacht do
  @type category ::
          :ones
          | :twos
          | :threes
          | :fours
          | :fives
          | :sixes
          | :full_house
          | :four_of_a_kind
          | :little_straight
          | :big_straight
          | :choice
          | :yacht

  @type die_roll :: 1 | 2 | 3 | 4 | 5 | 6
  @type dice_roll :: [die_roll]

  @doc """
  Calculate the score of 5 dice using the given category's scoring method.
  """
  @spec score(category :: category(), dice_roll :: dice_roll) :: non_neg_integer
  def score(category, dice_roll) do
    do_score(category, Enum.sort(dice_roll)) 
  end

  def do_score(:ones, dice_roll), do: score_single_value(1, dice_roll)
  def do_score(:twos, dice_roll), do: score_single_value(2, dice_roll)
  def do_score(:threes, dice_roll), do: score_single_value(3, dice_roll)
  def do_score(:fours, dice_roll), do: score_single_value(4, dice_roll)
  def do_score(:fives, dice_roll), do: score_single_value(5, dice_roll)
  def do_score(:sixes, dice_roll), do: score_single_value(6, dice_roll)

  def do_score(:four_of_a_kind, [a, a, a, a, _]), do: 4 * a
  def do_score(:four_of_a_kind, [_, b, b, b, b]), do: 4 * b

  def do_score(:full_house, [a, a, a, b, b]) when a != b, do: 3 * a + 2 * b
  def do_score(:full_house, [a, a, b, b, b]) when a != b, do: 2 * a + 3 * b
  
  def do_score(:little_straight, [1, 2, 3, 4, 5]), do: 30
  
  def do_score(:big_straight, [2, 3, 4, 5, 6]), do: 30
  
  def do_score(:yacht, [a, a, a, a, a]), do: 50
  
  def do_score(:choice, dice_roll), do: dice_roll |> Enum.sum()
  
  def do_score(_, _), do: 0

  def score_single_value(value, dice_roll) do
    case dice_roll |> Enum.frequencies() do
      %{^value => count} -> count * value
      _ -> 0
    end
  end
end
