# 読むノードを洗い出してからトポロジカルソート 多分正しいけどTLE起こすバージョン
n = gets.chomp.to_i

books_nexts = Array.new(n + 1) { [] }
books_premises = Array.new(n + 1) { [] }
first_nodes = []
n.times do |i|
  book_no = i + 1
  book = gets.chomp.split.map(&:to_i)
  premises = book[1..]

  premises.each do |premise|
    books_nexts[premise] << book_no
  end
  books_premises[book_no] = premises
  first_nodes << book_no if premises.empty?
end

tree_of_1 = {}
current_nodes = [1]

until current_nodes.empty?
  next_nodes = {}
  current_nodes.each do |current_node|
    tree_of_1[current_node] = true
    books_premises[current_node].each do |next_node|
      next_nodes[next_node] = true
    end
  end

  current_nodes = next_nodes.keys
end

order = []
current_nodes = first_nodes
graph = books_premises

until current_nodes.empty?
  next_nodes = {}
  current_nodes.each do |current_node|
    next unless tree_of_1[current_node]

    order << current_node if current_node > 1
    books_nexts[current_node].each do |next_node|
      graph[next_node].delete(current_node)
      next unless tree_of_1[next_node]

      next_nodes[next_node] = true if graph[next_node].empty?
    end
  end

  current_nodes = next_nodes.keys
end

puts order.join ' '
