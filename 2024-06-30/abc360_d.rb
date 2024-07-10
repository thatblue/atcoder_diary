# cf. https://atcoder.jp/contests/abc360/submissions/55066805
n, t = gets.chomp.split.map(&:to_i)
direction = gets.chomp
initial_positions = gets.chomp.split.map(&:to_i)

positive_moves = []
negative_moves = []

n.times do |i|
  if direction[i] == '1'
    positive_moves << initial_positions[i]
  else
    negative_moves << initial_positions[i]
  end
end

positive_moves.sort!
negative_moves.sort!

ans = 0
negative_moves_length = negative_moves.length
positive_moves.each do |pos|
  start_index = negative_moves.bsearch_index { |v| v >= pos }
  next if start_index.nil?

  end_index = negative_moves.bsearch_index { |v| v > pos + t * 2 } || negative_moves_length
  max_index = end_index - 1

  ans += max_index - (start_index - 1)
end

puts ans
