# cf. https://atcoder.jp/contests/abc263/submissions/33827690
n, l, r = gets.chomp.split.map(&:to_i)
array = gets.chomp.split.map(&:to_i)

l_array = [0]
l_sum = 0
array.each_with_index do |current, index|
  l_sum = [l_sum + current, (index + 1) * l].min
  l_array << l_sum
end

r_array = [0]
r_sum = 0
array.reverse.each_with_index do |current, index|
  r_sum = [r_sum + current, (index + 1) * r].min
  r_array << r_sum
end

p (n + 1).times.map {
  l_array.shift + r_array.pop
}.min