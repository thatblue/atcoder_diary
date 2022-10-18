n, k = gets.chomp.split.map(&:to_i)

gains = []
n.times do
  full, partial = gets.chomp.split.map(&:to_i)
  gains << partial
  gains << full - partial
end

gains.sort! { |a, b| b <=> a }

puts gains[..k - 1].sum
