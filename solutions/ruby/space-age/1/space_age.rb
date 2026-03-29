# frozen_string_literal: true

# Class for returning a person's age in years relative to the year on that planet
class SpaceAge
  def initialize(seconds)
    @age = seconds
  end

  SECONDS_PER_EARTH_YEAR = 31_557_600.0

  RELATIVE_PERIOD = {
    'earth' => 1,
    'mercury' => 0.2408467,
    'venus' => 0.61519726,
    'mars' => 1.8808158,
    'jupiter' => 11.862615,
    'saturn' => 29.447498,
    'uranus' => 84.016846,
    'neptune' => 164.79132
  }.freeze

  private_constant :SECONDS_PER_EARTH_YEAR
  private_constant :RELATIVE_PERIOD

  # Create the `on_<planet>` methods
  RELATIVE_PERIOD.each_pair do |planet, period|
    define_method "on_#{planet}" do
      @age / 31_557_600.0 / period
    end
  end
end
