module Raindrops
  FACTORS = [
    [->(n) { (n % 3).zero? }, 'Pling'],
    [->(n) { (n % 5).zero? }, 'Plang'],
    [->(n) { (n % 7).zero? }, 'Plong']
  ].freeze

  def self.convert(number)
    result = FACTORS.each_with_object('') do |(divisor, sound), combined_sound|
      combined_sound << sound if divisor.call(number)
    end
    result.empty? ? number.to_s : result
  end
end
