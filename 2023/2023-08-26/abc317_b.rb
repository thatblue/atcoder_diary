n = gets.chomp.to_i
numbers = gets.chomp.split.map(&:to_i).sort

prev_no = numbers[0] - 1
numbers.each do |number|
  if prev_no + 1 < number
    puts number - 1
    exit
  end
  prev_no = number
end

puts if numbers[0] == 1 ? numbers[-1] + 1 : numbers[0] - 1
