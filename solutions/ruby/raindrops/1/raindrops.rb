module Raindrops
  @@triggers = [
    ['Pling', ->(n) { (n % 3).zero? }],
    ['Plang', ->(n) { (n % 5).zero? }],
    ['Plong', ->(n) { (n % 7).zero? }]
  ]

  def self.convert(number)
    result = ''
    @@triggers.each do |(sound, divisor)|
      result << sound if divisor.call(number)
    end
    result.empty? ? number.to_s : result
  end
end
