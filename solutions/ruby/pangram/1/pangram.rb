# frozen_string_literal: true

require 'set'

module Pangram
  def self.pangram?(sentence)
    letters = Set.new | sentence.downcase.chars
    alphabet = Set.new | ('a'..'z')
    alphabet.subset?(letters)
  end
end
