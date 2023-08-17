require 'set'

n, q = gets.chomp.split.map(&:to_i)

$queue = []
$booked = Set.new
latest_called = 0
$latest_unbooked_index = 0
ans = []

def next_unbooked
  return $queue.length if $queue.length == $booked.length
  return $latest_unbooked_index unless $booked.include?($queue[$latest_unbooked_index])

  ($latest_unbooked_index + 1).upto($queue.length) do |current_index|
    return current_index unless $booked.include?($queue[current_index])
  end
end

q.times do
  query = gets.chomp.split.map(&:to_i)

  if query[0] == 1
    latest_called += 1
    $queue << latest_called
  elsif query[0] == 2
    $booked.add(query[1])
    $latest_unbooked_index = next_unbooked
  else
    ans << $queue[$latest_unbooked_index]
  end
end

puts ans
