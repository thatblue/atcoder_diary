n, m = gets.chomp.split.map(&:to_i)

array = []
n.times do
  array << gets.chomp.chars.map { |result| result === 'o' }
end

count = 0
(0..n-1).to_a.combination(2) do |pair|
  pair_result = true
  m.times do |q_index|
    pair_result = pair_result && (array[pair[0]][q_index] || array[pair[1]][q_index])
  end

  count += 1 if pair_result
end

puts count
