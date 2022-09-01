# https://atcoder.jp/contests/abc265/submissions/34228162
require "set"

_, p, q, r = gets.chomp.split.map(&:to_i)

total = 0
cumu_sum = gets.chomp.split.map { |value| total += value.to_i}
cumu_sum.unshift(0)
cumu_sum_set = cumu_sum.to_set

cumu_sum.each do |current_sum|
  cumu_sum_to_first_segment = p + current_sum
  next unless cumu_sum_set.include?(cumu_sum_to_first_segment)

  cumu_sum_to_second_segment = q + cumu_sum_to_first_segment
  next unless cumu_sum_set.include?(cumu_sum_to_second_segment)

  cumu_sum_to_third_segment = r + cumu_sum_to_second_segment
  next unless cumu_sum_set.include?(cumu_sum_to_third_segment)

  puts "Yes"
  exit
end

puts "No"
