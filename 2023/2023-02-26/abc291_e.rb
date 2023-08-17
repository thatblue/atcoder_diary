# 条件をX->Yの有向グラフに読み替え、トポロジカルソートをして一直線に並べることが出来れば数列を一意に特定することができる
require 'set'

n, m = gets.chomp.split.map(&:to_i)

graph = Array.new(n + 1) { Set.new }
# 入次数を求めておく
indegrees = Array.new(n + 1, 0)
m.times do
  from, to = gets.chomp.split.map(&:to_i)
  next if graph[from].include? to

  graph[from].add(to)
  indegrees[to] += 1
end

# グラフの始点を知りたいので入次数0のノードを探す
smallests = []
1.upto(n) do |i|
  smallests << i if indegrees[i].zero?
end

visited = []
order = Array.new(n + 1)
1.upto(n) do |i|
  # 最小値候補のノードが複数ある＝数列を1つに絞り込めない なのでそのままNoを出力して終了
  if smallests.count > 1
    puts 'No'
    exit
  end

  smallest = smallests.shift
  visited << smallest
  order[smallest] = i

  candidates = graph[smallest]
  next_smallests = []

  candidates.each do |candidate|
    # smallestなノードぶんの入次数を削除して次のsmallestを探す
    indegrees[candidate] -= 1
    next_smallests << candidate if indegrees[candidate].zero?
  end

  smallests = next_smallests
end

puts 'Yes'
puts order[1..].join ' '
