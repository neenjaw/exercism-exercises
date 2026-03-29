# frozen_string_literal: true

# Determine if supplied year is a leap year.
module Year
  def self.leap?(year)
    if !(year % 4).zero?
      false
    elsif (year % 400).zero?
      true
    elsif (year % 100).zero?
      false
    else
      true
    end
  end
end
