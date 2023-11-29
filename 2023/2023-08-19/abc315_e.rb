n = gets.chomp.to_i

$books_premises = Array.new(n + 1) { [] }
n.times do |i|
  book_no = i + 1
  book = gets.chomp.split.map(&:to_i)
  premises = book[1..]

  $books_premises[book_no] = premises
end

$visited = {}
$order = []
def dfs(current)
  return if $visited[current]

  $visited[current] = true

  if $books_premises[current].empty?
    $order << current if current > 1
    return
  end

  $books_premises[current].each do |premise|
    dfs(premise)
  end

  $order << current if current > 1
end

dfs(1)

puts $order.join ' '
