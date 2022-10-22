h, w = gets.chomp.split.map(&:to_i)

box_count = Array.new(w, 0)
h.times do
  gets.chomp.chars.each_with_index do |c, j|
    box_count[j] += 1 if c == "#"
  end
end

puts box_count.join(" ")