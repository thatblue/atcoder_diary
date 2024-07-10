POS_A = 0
POS_B = 1
POS_C = 2
POS_D = 3
POS_E = 4
POS_F = 5

rect_1 = gets.chomp.split.map(&:to_i)
rect_2 = gets.chomp.split.map(&:to_i)

x_length = [0, [rect_1[POS_D], rect_2[POS_D]].min - [rect_1[POS_A], rect_2[POS_A]].max].max
y_length = [0, [rect_1[POS_E], rect_2[POS_E]].min - [rect_1[POS_B], rect_2[POS_B]].max].max
z_length = [0, [rect_1[POS_F], rect_2[POS_F]].min - [rect_1[POS_C], rect_2[POS_C]].max].max

if x_length > 0 && y_length > 0 && z_length > 0
  puts 'Yes'
else
  puts 'No'
end
