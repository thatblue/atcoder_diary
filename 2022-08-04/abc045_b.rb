
s_a = gets.chomp.chars
s_b = gets.chomp.chars
s_c = gets.chomp.chars

current_card = s_a.shift
loop do
  if current_card == "a"
    current_card = s_a.shift
    if current_card.nil?
      puts "A"
      exit
    end
  elsif current_card == "b"
    current_card = s_b.shift
    if current_card.nil?
      puts "B"
      exit
    end
  else
    current_card = s_c.shift
    if current_card.nil?
      puts "C"
      exit
    end
  end
end
