defmodule Lasagna do
  # TODO: define the 'expected_minutes_in_oven/0' function
  def expected_minutes_in_oven, do: 40
  # TODO: define the 'remaining_minutes_in_oven/1' function
  def remaining_minutes_in_oven(time_elapsed), do: expected_minutes_in_oven() - time_elapsed
  # TODO: define the 'preparation_time_in_minutes/1' function
  def preparation_time_in_minutes(layers), do: 2 * layers 
  # TODO: define the 'total_time_in_minutes/2' function
  def total_time_in_minutes(layers, time_elapsed), do: preparation_time_in_minutes(layers) + time_elapsed
  # TODO: define the 'alarm/0' function
  def alarm, do: "Ding!"
end
