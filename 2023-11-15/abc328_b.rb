n = gets.chomp.to_i
days_of_month = gets.chomp.split.map(&:to_i)

ans = 0
days_of_month.each_with_index do |days, index|
  month_chars = (index + 1).to_s.chars.uniq
  next if month_chars.count > 1
  month_char = month_chars[0]

  (1..days).each do |day_of_month|
    day_chars = day_of_month.to_s.chars.uniq
    next if day_chars.count > 1

    ans += 1 if day_chars[0] == month_char
  end
end

puts ans
