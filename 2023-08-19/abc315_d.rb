h, w = gets.chomp.split.map(&:to_i)

cookies = []

h.times do
  row = gets.chomp
  cookies << row.chars if row.squeeze >= 2
end

transposed = cookies.transpose

transposed.each do |col|
  
end
