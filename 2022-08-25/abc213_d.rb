n = gets.chomp.to_i

paths = Array.new(n + 1) { Array.new }

(n-1).times do
  from, to = gets.chomp.split.map(&:to_i)
  paths[from] << to
  paths[from].sort!
  paths[to] << from
  paths[to].sort!
end

route = [1]
prev_town = Hash.new
prev_town[1] = 1
last_town = 1
loop do
  back_prev_town = true
  paths[last_town].each do |next_town|
    if prev_town[next_town].nil?
      route << next_town
      prev_town[next_town] = last_town
      last_town = next_town
      back_prev_town = false
      break
    end
  end

  if back_prev_town
    if last_town == 1
      break
    end

    last_town = prev_town[last_town]
    route << last_town
  end
end

puts route.join(" ")
