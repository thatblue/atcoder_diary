n = gets.chomp.to_i
s_x, s_y, t_x, t_y = gets.chomp.split.map(&:to_i)

def in_circle(a, b, r, x, y)
  (x - a) ** 2 + (y - b) ** 2 == r ** 2
end

def movable_circles(circles)
  movable_circles = []
  circles.each_with_index do |value, index|
    if value == 1
      movable_circles << index
    end
  end

  movable_circles
end

def connected_to_goal(current, destinations, connections, exclude)
  if destinations.include?(current)
    return true
  end

  exclude << current

  movable_circles = connections[current].difference(exclude)

  movable_circles.each do | next_circle |
    if connected_to_goal(next_circle, destinations, connections, exclude)
      return true
    end
  end

  false
end

circles = []
# circle_connections = Array.new(n) {Array.new(n, 0)}
circle_connections = Array.new(n) {[]}
start_circle_indexes = []
goal_circle_indexes = []

(0..(n-1)).each do |index|
  x, y, r = gets.chomp.split.map(&:to_i)
  if in_circle(x, y, r, s_x, s_y)
    start_circle_indexes << index
  end

  if in_circle(x, y, r, t_x, t_y)
    goal_circle_indexes << index
  end

  circles.each_with_index do |circle, other_index|
    distance_pow2 = (x - circle[0]) ** 2 + (y - circle[1]) ** 2

    if distance_pow2 > (r + circle[2]) ** 2 || distance_pow2 < (r - circle[2]).abs ** 2
      next
    end

    circle_connections[index] << other_index
    circle_connections[other_index] << index
  end

  circles << [x, y, r]
end

start_circle_indexes.each do |start_circle|
  if connected_to_goal(start_circle, goal_circle_indexes, circle_connections, [])
    puts "Yes"
    exit
  end
end

puts "No"

