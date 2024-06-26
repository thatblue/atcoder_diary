nums = gets.chomp.split.map(&:to_i)

prev = 0
nums.each do |num|
  if num < prev
    puts 'No'
    exit
  end

  unless num.between?(100, 675)
    puts 'No'
    exit
  end

  if num % 25 != 0
    puts 'No'
    exit
  end

  prev = num
end

puts 'Yes'
