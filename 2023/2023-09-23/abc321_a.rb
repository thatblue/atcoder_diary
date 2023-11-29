s = gets.chomp.chars.map(&:to_i)

prev_num = nil
s.each do |current_num|
  if prev_num.nil?
    prev_num = current_num
    next
  end

  if prev_num <= current_num
    puts 'No'
    exit
  end

  prev_num = current_num
end

puts 'Yes'
