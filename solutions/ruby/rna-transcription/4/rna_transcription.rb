# frozen_string_literal: true

# module for working with DNA/RNA strands
module Complement
  # def self.of_dna(strand)
  #   strand.tr('GCTA', 'CGAU')
  # end

  def self.of_dna(strand)
    strand.chars.map { |c| translate(c) }.join
  end

  private_class_method def self.translate(char)
    PAIRS[char] || char
  end

  PAIRS = {
    'G' => 'C',
    'C' => 'G',
    'T' => 'A',
    'A' => 'U'
  }.freeze
  private_constant :PAIRS
end
