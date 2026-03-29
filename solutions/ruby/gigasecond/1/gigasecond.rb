# frozen_string_literal: true

# class Gigasecond to calculate the date at which a gigasecond occurs from the supplied date
class Gigasecond
  GIGASECOND = 1e9

  def self.from(time)
    Time.at(time.to_i + GIGASECOND)
  end
end
