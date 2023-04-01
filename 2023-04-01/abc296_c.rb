n, x = gets.chomp.split.map(&:to_i)
array = gets.chomp.split.map(&:to_i).sort

n.times do |i|
  i.upto(n-1) do |j|
    if
  end
end

left = 0

while left < n
   right = left
   while right < n
    if (array[left] - array[right]) == x || (array[right] - array[left]) == x
      puts 'Yes'
      exit
    end
    right += 1
   end
   left += 1
end

puts 'No'
