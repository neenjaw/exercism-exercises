class Raindrops
  attr_reader :raindrop_speak

  FACTOR_NOISE = {
    3 => 'Pling',
    5 => 'Plang',
    7 => 'Plong'
  }.freeze

  private_constant :FACTOR_NOISE

  private

  def initialize(number)
    sound = sound(number)
    @raindrop_speak = sound.empty? ? number : sound
  end

  def sound(number)
    FACTOR_NOISE.each_with_object('') do |(factor, noise), sound|
      sound << noise if factor?(number, factor)
    end
  end

  def factor?(number, divisor)
    (number % divisor).zero?
  end

  public

  def to_s
    raindrop_speak.to_s
  end

  def self.convert(number)
    new(number).to_s
  end
end
