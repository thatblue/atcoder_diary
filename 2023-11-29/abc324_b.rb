n = gets.chomp.to_i

60.times do |x|
  50.times do |y|
    candidate = 2**x * 3**y
    if n == candidate
      puts 'Yes'
      exit
    end
  end
end

puts 'No'
