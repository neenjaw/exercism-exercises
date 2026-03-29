module Raindrops
  def self.convert(number)
    do_convert(number).to_s
  end

  class << self
    private

    FACTOR_NOISES = {
      3 => 'Pling',
      5 => 'Plang',
      7 => 'Plong'
    }.freeze

    def do_convert(number)
      FACTOR_NOISES.each_with_object(result = '') do |(factor, noise), sound|
        sound << noise if factor?(number, factor)
      end
      default_if_empty(result, number)
    end

    def factor?(number, divisor)
      (number % divisor).zero?
    end

    def default_if_empty(sound, number)
      sound.empty? ? number : sound
    end
  end
end
