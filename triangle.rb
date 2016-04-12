# Triangle Project Code.

# Triangle analyzes the lengths of the sides of a triangle
# (represented by a, b and c) and returns the type of triangle.
#
# It returns:
#   :equilateral  if all sides are equal
#   :isosceles    if exactly 2 sides are equal
#   :scalene      if no sides are equal
#
# The tests for this method can be found in
#   about_triangle_project.rb
# and
#   about_triangle_project_2.rb
#

def triangle(a, b, c)
  a, b, c = [a, b, c].sort

  raise TriangleError if a <= 0

  begin
    angle = (Math.acos((a ** 2 + b ** 2 - c ** 2) / (2.0 * a * b)) / Math::PI * 180).round

    if angle < 180
      if a == b || b == c
        return angle == 60 ? :equilateral : :isosceles
      end

      return :scalene
    end
  rescue Exception
    raise TriangleError
  end

  raise TriangleError
end

# Error class used in part 2.  No need to change this code.
class TriangleError < StandardError
end
