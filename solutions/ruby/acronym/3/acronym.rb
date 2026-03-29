# frozen_string_literal: true

# Create acronyms from a phrase represented as a string
module Acronym
  def self.abbreviate(phrase)
    phrase.scan(/\b\w/).join.upcase
  end
end
