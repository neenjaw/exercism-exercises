class Raindrops
  class << self
    FACTOR_NOISE = {
      3 => 'Pling',
      5 => 'Plang',
      7 => 'Plong'
    }.freeze

    private_constant :FACTOR_NOISE

    private

    def collect(number)
      sound = sound(number)
      raindrop_speak(sound, number)
    end

    def sound(number)
      FACTOR_NOISE.each_with_object('') do |(factor, noise), sound|
        sound << noise if factor?(number, factor)
      end
    end

    def factor?(number, divisor)
      (number % divisor).zero?
    end

    def raindrop_speak(sound, number)
      sound.empty? ? number : sound
    end

    public

    def convert(number)
      collect(number).to_s
    end
  end
end
