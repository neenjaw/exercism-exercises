# Class for representing a geometric triangle
class Triangle
  attr_reader :sides

  def initialize(sides)
    @sides = sides
    @sides = [] if invalid?
  end

  #   Side lengths are tested against their uniqueness, e.g.:
  #     - equilateral triangles have 1 unique side length
  #     - isosceles triangles have 1 or 2 unique side lengths
  #     - scalene triangles have 3 unique side lengths
  def equilateral?
    sides.uniq.size.eql?(1)
  end

  def isosceles?
    sides.uniq.size.between?(1, 2)
  end

  def scalene?
    sides.uniq.size.eql?(3)
  end

  private

  def invalid?
    invalid_side? || violates_inequality?
  end

  def invalid_side?
    sides.any? { |side| side <= 0 }
  end

  def violates_inequality?
    side_a, side_b, side_c = sides
    side_a + side_b <= side_c ||
      side_b + side_c <= side_a ||
      side_a + side_c <= side_b
  end
end
