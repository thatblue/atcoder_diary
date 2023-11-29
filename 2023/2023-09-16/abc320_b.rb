s = gets.chomp
length = s.length

longest_streak = 0
(0...length).each do |i|
  (i...length).each do |j|
    current_string = s[i..j]
    if current_string == current_string.reverse
      longest_streak = [longest_streak, current_string.length].max
    end
  end
end

puts longest_streak
