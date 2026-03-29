defmodule RemoteControlCar do
  @enforce_keys [:nickname]
  defstruct [:nickname, battery_percentage: 100, distance_driven_in_meters: 0]

  def new() do
    %__MODULE__{nickname: "none"}
  end

  def new(nickname) do
    %__MODULE__{nickname: nickname}
  end

  def display_distance(%__MODULE__{distance_driven_in_meters: d}) do
    "#{d} meters"
  end

  def display_battery(%__MODULE__{battery_percentage: 0}), do: "Battery empty"
  def display_battery(%__MODULE__{battery_percentage: b}) do
    "Battery at #{b}%"
  end

  def drive(%__MODULE__{battery_percentage: 0} = car), do: car
  def drive(%__MODULE__{} = car) do
    %{ car | 
      battery_percentage: car.battery_percentage - 1,
      distance_driven_in_meters: car.distance_driven_in_meters + 20
    }
  end
end
