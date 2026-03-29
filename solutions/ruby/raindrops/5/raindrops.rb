module Raindrops
  # Conversion class to convert the number to the string
  class Converter
    FACTOR_RULES = {
      3 => 'Pling',
      5 => 'Plang',
      7 => 'Plong'
    }.freeze

    def convert(number)
      FACTOR_RULES.each_with_object(result = '') do |(factor, sound), combined_sound|
        combined_sound << sound if factor?(number, factor)
      end
      result.empty? ? number.to_s : result
    end

    def factor?(number, divisor)
      (number % divisor).zero?
    end
  end

  def self.convert(number)
    Converter.new.convert(number)
  end
end
