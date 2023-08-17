col_keys = ['a', 'b', 'c', 'd', 'e', 'f', 'g', 'h']
row_keys = [8, 7, 6, 5, 4, 3, 2, 1]

8.times do |row|
  gets.chomp.chars.to_a.each_with_index do |val, col|
     if val == '*'
       puts col_keys[col] + row_keys[row].to_s
       exit
     end
   end
end
