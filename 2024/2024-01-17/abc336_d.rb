# 解説の写経
# https://atcoder.jp/contests/abc336/editorial/9076

n = gets.chomp.to_i
array = [0] + gets.chomp.split.map(&:to_i) + [0]

pyramid_up = Array.new(n, 0)
pyramid_down = Array.new(n, 0)

pyramid_up[0] = [array[0], array[1] - 1].min
1.upto(n - 1) do |i|
  pyramid_up[i] = [pyramid_up[i - 1], array[i + 1] - i - 1].min
end

pyramid_down[n - 1] = array[n + 1] + n + 1
(n - 2).downto(1) do |i|
  pyramid_down[i] = [pyramid_down[i + 1], array[i + 2] + i + 2].min
end

ans = 0
n.times do |i|
  ans = [ans, [pyramid_up[i] + i + 1, pyramid_down[i] - i - 1].min].max
end

puts ans
