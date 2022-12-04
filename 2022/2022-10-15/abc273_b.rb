x, k = gets.chomp.split.map(&:to_i)

k.times do |i|
  x = x.round(-(i + 1))
end

p x
