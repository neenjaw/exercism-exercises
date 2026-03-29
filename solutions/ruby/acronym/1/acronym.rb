# frozen_string_literal: true

# Create acronyms from a phrase represented as a string
module Acronym
  # Subclass to parse the string into an acronym
  class Parser
    def parse(phrase)
      phrase
        .each_char
        .each_with_object({ take: true, str: String.new }) do |char, hash|
          if hash[:take] && letter?(char)
            hash[:take] = false
            hash[:str] <<= char.upcase
          elsif space?(char) || hyphen?(char)
            hash[:take] = true
          end
        end[:str]
    end

    private

    def letter?(char)
      ('a'..'z').cover?(char) or ('A'..'Z').cover?(char)
    end

    def space?(char)
      char == ' '
    end

    def hyphen?(char)
      char == '-'
    end

    def uppercase?(char)
      char == char.upcase
    end
  end

  def self.abbreviate(phrase)
    Parser.new.parse(phrase)
  end
end
