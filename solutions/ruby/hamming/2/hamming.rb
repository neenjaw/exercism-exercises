# Hamming, determine the divergence of two DNA strands
module Hamming
  def self.compute(strand_a, strand_b)
    raise ArgumentError if strand_a.length != strand_b.length

    strand_a.each_char.zip(strand_b.each_char).count { |pair| pair[0] != pair[1] }
  end
end
