# cf. https://atcoder.jp/contests/dp/submissions/33366900
n = gets.chomp.to_i

a_max = Array.new(n + 1, 0)
b_max = Array.new(n + 1, 0)
c_max = Array.new(n + 1, 0)

n.times do|i|
  a, b, c = gets.chomp.split.map(&:to_i)

  a_max[i] = [a + b_max[i - 1], a + c_max[i - 1]].max
  b_max[i] = [b + a_max[i - 1], b + c_max[i - 1]].max
  c_max[i] = [c + a_max[i - 1], c + b_max[i - 1]].max
end

p [a_max[n - 1], b_max[n - 1], c_max[n - 1]].max
