# frozen_string_literal: true

# Class for returning a person's age in years relative to the year on that planet
class SpaceAge
  def initialize(age_in_seconds)
    @age = age_in_seconds
  end

  SECONDS_PER_EARTH_YEAR = 31_557_600.0
  private_constant :SECONDS_PER_EARTH_YEAR

  PLANET_YEAR_PER_EARTH_YEAR = {
    'earth' => 1,
    'mercury' => 0.2408467,
    'venus' => 0.61519726,
    'mars' => 1.8808158,
    'jupiter' => 11.862615,
    'saturn' => 29.447498,
    'uranus' => 84.016846,
    'neptune' => 164.79132
  }.freeze
  private_constant :PLANET_YEAR_PER_EARTH_YEAR

  # Create the `on_<planet>` methods to determine age on another planet
  PLANET_YEAR_PER_EARTH_YEAR.each_pair do |planet, year_relative_to_earth_year|
    define_method "on_#{planet}" do
      @age / SECONDS_PER_EARTH_YEAR / year_relative_to_earth_year
    end
  end
end
