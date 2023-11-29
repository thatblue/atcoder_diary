n = gets.chomp.to_i

bets = {}
counts = {}

n.times do |i|
  p = i + 1
  c_i = gets.chomp.to_i
  counts[p] = c_i
  bets_i = gets.chomp.split.map(&:to_i)
  bets_i.each do |bet_i|
    bets[bet_i] ||= []
    bets[bet_i] << p
  end
end

x = gets.chomp.to_i

if bets[x].nil?
  puts 0
  exit
end

ans_counts = {}
bets[x].each do |p|
  ans_counts[counts[p]] ||= []
  ans_counts[counts[p]] << p
end

smallest = ans_counts.keys.sort[0]
puts ans_counts[smallest].count
puts ans_counts[smallest].join ' '
