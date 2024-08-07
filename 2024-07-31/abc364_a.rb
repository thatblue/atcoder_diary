n = gets.chomp.to_i

prev = nil
(n-1).times do # 最後の皿が甘い料理で気持ち悪くなっても食べきることはできる
  current = gets.chomp

  if prev == 'sweet' && current == 'sweet'
    puts 'No'
    exit
  end

  prev = current
end

puts 'Yes'
