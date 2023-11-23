N, Q = gets.split.map(&:to_i)
C = gets.split.map(&:to_i)
QUERIES = Q.times.map { gets.split.map(&:to_i) }

# それぞれの箱に色の集合を保持するハッシュを初期化
boxes = Array.new(N + 1) { Set.new }

# 初期色のセットアップ
N.times do |i|
  boxes[i+1].add(C[i])
end

QUERIES.each do |a, b|
  if boxes[a].size < boxes[b].size
    # AをBに入れる
    if boxes[a]
      boxes[b].merge(boxes[a])
      boxes[a] = Set.new
    end
  else
    # BをAに入れて、その後交換する
    if boxes[b]
      boxes[a].merge(boxes[b])
      boxes[b] = boxes[a]
      boxes[a] = Set.new
    end
  end

  puts boxes[b].size
end
