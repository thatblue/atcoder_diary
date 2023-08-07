n, $s, $t = gets.chomp.split.map(&:to_i)

$tree = Array.new(n + 1) { [] }
(n-1).times do
    u, v = gets.chomp.split.map(&:to_i)
    $tree[u] << v
    $tree[v] << u
end

$visited = {}
$s_nodes = Array.new(n + 1) { [] }
$t_nodes = Array.new(n + 1) { [] }
def search(current_node, previous_route, start_node)

    has_next = false
    current_route = previous_route + [current_node]
    $visited[current_node] = true
    if start_node == $s
        $s_nodes[current_node] = current_route
    else
        $t_nodes[current_node] = current_route
    end

    $tree[current_node].each do |next_node|
        next if $visited[next_node]
        search(next_node, current_route, start_node)
    end
end

search($s, [], $s)
s_to_t = $s_nodes[t]

(1..n).each do |j|
    puts $s_nodes[j].intersection(s_to_t).count
end
