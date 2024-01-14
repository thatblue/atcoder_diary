N = gets.chomp.to_i

GOOD_DIGITS = ['0', '2', '4', '6', '8']

n_in_quintal = (N - 1).to_s(5).chars.map(&:to_i)

ans = ''
n_in_quintal.each do |digit|
  ans += GOOD_DIGITS[digit]
end

puts ans
