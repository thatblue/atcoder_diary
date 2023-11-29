n, m = gets.chomp.split.map(&:to_i)

s = gets.chomp.chars

colors = gets.chomp.split.map(&:to_i)

chars = {}
s.each_with_index do |char, i|
  color_i = colors[i]
  chars[color_i] ||= []
  chars[color_i] << char
end

first_visit = Hash.new(true)
counters = Hash.new(0)
colors.each_with_index do |color, i|
  if first_visit[color]
    print chars[color][-1]
    counters[color] = 0
    first_visit[color] = false
  else
    print chars[color][counters[color]]
    counters[color] += 1
  end
end

print "\n"
