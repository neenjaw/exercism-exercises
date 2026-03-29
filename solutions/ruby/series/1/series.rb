class Series
  attr_reader :input

  def initialize(input)
    @input = input.chars.freeze
  end

  def slices(length)
    raise ArgumentError if length > input.length

    input.each_cons(length).map(&:join)
  end
end
