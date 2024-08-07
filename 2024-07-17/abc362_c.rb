# 解説の写経
# cf. https://atcoder.jp/contests/abc362/editorial/10394
n = gets.chomp.to_i

lefts = []
rights = []
n.times do
  left, right = gets.chomp.split.map(&:to_i)
  lefts << left
  rights << right
end

# 最小値の合計～最大値の合計 が0を跨いでないと調整のしようがない
if lefts.sum > 0 || rights.sum < 0
  puts 'No'
  exit
end

x = lefts.dup
diff = lefts.sum
n.times do |i|
  # 調整が終わったらあとはもうそのままの値でOK
  next if diff.zero?

  x[i] = [rights[i], lefts[i] - diff].min
  diff += x[i] - lefts[i]
end

puts 'Yes'
puts x.join ' '
