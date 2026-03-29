class Raindrops
  attr_reader :number, :sound

  def initialize(number)
    @number = number
    FACTOR_NOISES.each_with_object(@sound = '') do |(factor, noise), sound|
      sound << noise if factor?(number, factor)
    end
  end

  def self.convert(number)
    new(number).to_s
  end

  def to_s
    (sound.empty? ? number : sound).to_s
  end

  private

  FACTOR_NOISES = {
    3 => 'Pling',
    5 => 'Plang',
    7 => 'Plong'
  }.freeze

  def factor?(number, divisor)
    (number % divisor).zero?
  end
end
