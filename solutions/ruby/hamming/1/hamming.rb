# Hamming, determine the divergence of two DNA strands
module Hamming
  def self.compute(strand_a, strand_b)
    raise ArgumentError if strand_a.length != strand_b.length

    strand_a.each_char.zip(strand_b.each_char).reduce(0) do |distance, pair|
      a, b = pair
      distance += 1 if a != b
      distance
    end
  end
end
