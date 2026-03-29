class Raindrops
  FACTOR_NOTE = {
    3 => 'Pling',
    5 => 'Plang',
    7 => 'Plong'
  }.freeze

  def self.convert(number)
    new(number).to_s
  end

  private

  attr_reader :raindrop_speak

  def initialize(number)
    @sound ||= FACTOR_NOTE.each_with_object('') do |(factor, noise), sound|
      sound << noise if factor?(number, factor)
    end
    @raindrop_speak = @sound.empty? ? number : @sound
  end

  def factor?(number, divisor)
    (number % divisor).zero?
  end

  public

  def to_s
    raindrop_speak.to_s
  end
end
