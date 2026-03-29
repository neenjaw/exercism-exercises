# Hamming, determine the divergence of two DNA strands
module Hamming
  def self.compute(strand_a, strand_b)
    raise ArgumentError if strand_a.length != strand_b.length

    strand_a.chars.zip(strand_b.chars).count { |pair| pair[0] != pair[1] }
  end
end
