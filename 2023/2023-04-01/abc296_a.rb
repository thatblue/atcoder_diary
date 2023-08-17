n = gets.chomp.to_i
s = gets.chomp.chars

prev = nil

s.each do |current|
  if prev == current
    puts "No"
    exit
  end

  prev = current
end

puts "Yes"
