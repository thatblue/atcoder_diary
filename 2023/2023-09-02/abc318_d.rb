n = gets.chomp.to_i

graph = Array.new(n+1) { Array.new(n+1, 0) }

1.upto(n-1) do |i|
  gets.chomp.split.each_with_index do |v, index|
    j = index + i + 1
    weight = v.to_i
    graph[i][j] = weight
    graph[j][i] = weight
  end
end

nodes = (1..n).to_a

dp = {}
dp[0] = 0
fullbit = 2**n-1
(1..fullbit).each do |bit|
  active_nodes = []
  n.times do |i|
    active_nodes << i + 1 if bit[i] == 1
  end

  next if active_nodes.count.odd?

  dp[bit] = 0

  active_nodes.combination(2).each do |latest_choices|
    a, b = latest_choices
    previous_bit = (active_nodes - latest_choices).inject(0) { |result, digit| result | (1 << (digit-1)) } || 0
    dp[bit] = [dp[bit], dp[previous_bit] + graph[a][b]].max
  end
end

puts dp.values.max
