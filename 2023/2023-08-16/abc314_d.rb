n = gets.chomp.to_i
s = gets.chomp.chars
q = gets.chomp.to_i

is_upper = nil
changed_chars = {}
after_latest_changed = {}
q.times do |i|
  t_i, x_i, c_i = gets.chomp.split

  if t_i == '1'
    index = x_i.to_i - 1
    changed_chars[index] = c_i
    after_latest_changed[index] = true
  elsif t_i == '2'
    is_upper = false
    after_latest_changed = {}
  else
    is_upper = true
    after_latest_changed = {}
  end
end

n.times do |i|
  char = changed_chars.include?(i) ? changed_chars[i] : s[i]
  if is_upper.nil? || after_latest_changed.include?(i)
    print char
  elsif is_upper
    print char.upcase
  else
    print char.downcase
  end
end

print "\n"
