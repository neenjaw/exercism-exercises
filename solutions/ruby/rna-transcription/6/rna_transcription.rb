# frozen_string_literal: true

# module for working with DNA/RNA strands
module Complement
  def self.of_dna(strand)
    strand.chars.map(&translate).join
  end

  # Lambda
  # def self.translate
  #   ->(char) { PAIRS[char] || char }
  # end
  # private_class_method :translate

  # Proc
  def self.translate
    proc { |char| PAIRS[char] || char }
  end
  private_class_method :translate

  PAIRS = {
    'G' => 'C',
    'C' => 'G',
    'T' => 'A',
    'A' => 'U'
  }.freeze
  private_constant :PAIRS
end
