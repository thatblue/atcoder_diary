s = gets.chomp
t = gets.chomp

puts s.length <= t.length && s == t[0..s.length - 1] ? "Yes" : "No"
