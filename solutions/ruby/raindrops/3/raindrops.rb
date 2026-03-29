module Raindrops
  # Conversion class to convert the number to the string
  class Converter
    attr_reader :factors

    def initialize
      @factors = [
        [->(n) { (n % 3).zero? }, 'Pling'],
        [->(n) { (n % 5).zero? }, 'Plang'],
        [->(n) { (n % 7).zero? }, 'Plong']
      ]
    end

    def convert(number)
      result = factors.each_with_object('') do |(divisor, sound), combined_sound|
        combined_sound << sound if divisor.call(number)
      end
      result.empty? ? number.to_s : result
    end
  end

  def self.convert(number)
    Converter.new.convert(number)
  end
end