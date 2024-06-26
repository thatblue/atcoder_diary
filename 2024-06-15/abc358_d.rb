n, m = gets.chomp.split.map(&:to_i)
souvenirs = gets.chomp.split.map(&:to_i).sort
friends = gets.chomp.split.map(&:to_i).sort

souvenir_index = 0
ans = 0
friends.each do |candy_count|
  if souvenir_index >= n
    puts -1
    exit
  end

  if candy_count <= souvenirs[souvenir_index]
    ans += souvenirs[souvenir_index]

    souvenir_index += 1
    next
  end

  next_index = souvenirs.bsearch_index { |value| value >= candy_count }

  if next_index.nil?
    # 渡せるお土産がもうない
    puts -1
    exit
  end

  ans += souvenirs[next_index]
  souvenir_index = next_index + 1
end

# 最後まで探索できたらansを出力
puts ans
