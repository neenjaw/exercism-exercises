require 'set'

class SumOfMultiples
  attr_reader :factors

  def initialize(*factors)
    @factors = factors
  end

  def to(limit)
    multiples =
      factors.inject(Set.new) do |set, factor|
        set | generate_multiples(factor, limit)
      end
    multiples.to_a.sum
  end

  private

  def generate_multiples(factor, limit)
    return [] if factor.zero?

    (factor...limit).step(factor).to_a
  end
end
