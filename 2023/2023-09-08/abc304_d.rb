h, w = gets.chomp.split.map(&:to_i)
n = gets.chomp.to_i

ichigo_positions = []
n.times do
  ichigo_positions << gets.chomp.split.map(&:to_i)
end

a = gets.chomp.to_i
x_cut_positions = gets.chomp.split.map(&:to_i)

b = gets.chomp.to_i
y_cut_positions = gets.chomp.split.map(&:to_i)

pieces = Hash.new(0)
ichigo_positions.each do |position|
  x_pos = x_cut_positions.bsearch_index { |x| x > position[0] } || a
  y_pos = y_cut_positions.bsearch_index { |y| y > position[1] } || b

  cake_no = x_pos + 1 + y_pos * (a + 1)
  pieces[cake_no] += 1
end

min, max = pieces.values.minmax
min = 0 if pieces.count < (a+1)*(b+1) # イチゴが載ってないケーキがある

puts "#{min} #{max}"
