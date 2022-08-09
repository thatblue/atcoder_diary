n = gets.chomp.to_i

match_results = []

n.times do
  match_results << gets.chomp.chars
end

n.times do |i|
  n.times do|j|
    if j <= i
      next
    end

    if match_results[i][j] == "D" && match_results[j][i] == "D"
      # 引き分けで矛盾していないこと
      next
    end

    if match_results[i][j] == "W" && match_results[j][i] == "L"
      # iが勝ちで矛盾していないこと
      next
    end

    if match_results[i][j] == "L" && match_results[j][i] == "W"
      # iが負けで矛盾していないこと
      next
    end

    puts "incorrect"
    exit
  end
end

puts "correct"
