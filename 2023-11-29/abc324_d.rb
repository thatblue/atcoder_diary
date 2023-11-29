include Math

n = gets.chomp.to_i
s = gets.chomp.chars.map(&:to_i)

min = s.sort.join.to_i
max = s.sort.reverse!.join.to_i

min_sqrt = Math.sqrt(min).floor
max_sqrt = Math.sqrt(max).ceil

s_tally = s.tally
s_tally.default = 0

ans = 0
num = min_sqrt

while num <= max_sqrt
  square_chars = (num**2).to_s
  square_chars_size = square_chars.size
  tally = s_tally.dup
  is_square_num = true

  square_chars_size.times do |char_index|
    char = square_chars[char_index].to_i
    if tally[char].zero?
      is_square_num = false
      break
    end

    tally[char] -= 1
  end

  pp [num, num**2] if is_square_num
  pp square_chars if is_square_num

  ans += 1 if is_square_num

  num += 1
end

puts ans
