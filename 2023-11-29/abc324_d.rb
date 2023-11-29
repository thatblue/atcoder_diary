n = gets.chomp.to_i
s = gets.chomp.chars.map(&:to_i)

s_sorted = s.sort
@s_tally = s_sorted.tally.to_h
@s_tally.default = 0
min = s_sorted.join.to_i
max = s_sorted.join.reverse.to_i

min_sqrt = Math.sqrt(min).floor
max_sqrt = Math.sqrt(max).ceil

# cf. https://atcoder.jp/contests/abc324/submissions/46568672
def permutation_of_s?(target)
  tally = Array.new(10, 0)
  digits = target.digits
  digits.each do |digit|
    tally[digit] += 1
  end

  tally[0] <= @s_tally[0] && (1..9).all? { |d| tally[d] == @s_tally[d] }
end

ans = 0
min_sqrt.upto(max_sqrt) do |num|
  ans += 1 if permutation_of_s?(num * num)
end

puts ans
