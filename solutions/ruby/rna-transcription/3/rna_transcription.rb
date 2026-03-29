# frozen_string_literal: true

# module for working with DNA/RNA strands
module Complement
  # def self.of_dna(strand)
  #   strand.tr('GCTA', 'CGAU')
  # end

  def self.of_dna(strand)
    strand.chars.map { |c| translate(c) }.join
  end

  PAIRS = {
    'G' => 'C',
    'C' => 'G',
    'T' => 'A',
    'A' => 'U'
  }.freeze

  def self.translate(char)
    complement = PAIRS[char]
    return complement unless complement.nil?

    char
  end
end
