X = 0
Y = 1

a = gets.chomp.split.map(&:to_i)
b = gets.chomp.split.map(&:to_i)
c = gets.chomp.split.map(&:to_i)
d = gets.chomp.split.map(&:to_i)

def is_convex?(hypotenuse1, hypotenuse2, point1, point2)
  if hypotenuse1[X] == hypotenuse2[X]
    min, max = [point1[X], point2[X]].minmax
    return min < hypotenuse1[X] && hypotenuse1[X] < max
  elsif hypotenuse1[Y] == hypotenuse2[Y]
    min, max = [point1[Y], point2[Y]].minmax
    return min < hypotenuse1[Y] && hypotenuse1[Y] < max
  else
    slope = (hypotenuse1[Y] - hypotenuse2[Y]).to_f / (hypotenuse1[X] - hypotenuse2[X]).to_f
    intercept = hypotenuse1[Y] - hypotenuse1[X] * slope
    point1_y = slope * point1[X] + intercept
    point2_y = slope * point2[X] + intercept

    if point1_y < point1[Y]
      is_convex = point2_y > point2[Y]
    else
      is_convex = point2_y < point2[Y]
    end
  end
  
  is_convex
end

puts is_convex?(a, c, b, d) && is_convex?(b, d, a, c) ? "Yes" : "No"