# frozen_string_literal: true

# Create acronyms from a phrase represented as a string
module Acronym
  def self.abbreviate(p)
    # p.scan(/^\w|(?<=[\s-])\w/).join.upcase
    p.gsub(/(?<!^|[\s-])\w|\W/, '').upcase
  end
end
