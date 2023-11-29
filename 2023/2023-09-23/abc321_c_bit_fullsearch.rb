k = gets.chomp.to_i

ans_array = []
SEARCH_MAX = 2**10-1
(2..SEARCH_MAX).each do |current_bit|
  digits = []
  (0..9).each do |i|
    digits.unshift(i) if current_bit[i] == 1
  end

  ans_array << digits.join.to_i
end

ans_array.sort!

puts ans_array[k - 1]
