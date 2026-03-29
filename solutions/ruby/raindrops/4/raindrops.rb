module Raindrops
  FACTOR_RULES = {
    3 => 'Pling',
    5 => 'Plang',
    7 => 'Plong'
  }.freeze

  def self.convert(number)
    is_factor = ->(n, divisor) { (n % divisor).zero? }

    FACTOR_RULES.each_with_object(result = '') do |(factor, sound), combined_sound|
      combined_sound << sound if is_factor.call(number, factor)
    end
    result.empty? ? number.to_s : result
  end
end
