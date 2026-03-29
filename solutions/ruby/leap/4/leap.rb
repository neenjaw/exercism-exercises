module Year
  # Determine if supplied year is a leap year.
  def self.leap?(year)
    (year % 4).zero? and (year % 100).nonzero? || (year % 400).zero?
  end
end
