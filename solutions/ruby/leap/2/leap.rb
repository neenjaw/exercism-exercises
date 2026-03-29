# frozen_string_literal: true

# Determine if supplied year is a leap year.
module Year
  def self.leap?(year)
    (year % 4).zero? && (year % 100).nonzero? || (year % 400).zero?
  end
end
