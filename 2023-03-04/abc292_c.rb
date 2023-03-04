n = gets.chomp.to_i

$pairs_counts = Array.new(n)

def pairs_count(val)
  return $pairs_counts[val] unless $pairs_counts[val].nil?

  $pairs_counts[val] = 0

  sqrt_val = Math.sqrt(val).floor
  1.upto(sqrt_val) do |i|
    div, mod = val.divmod(i)
    next if mod > 0

    $pairs_counts[val] += i == div ? 1 : 2
  end

  $pairs_counts[val]
end

ans = 0
loop_max = n.even? ? n / 2 - 1 : n / 2
1.upto(loop_max) do |x|
  ans += pairs_count(x) * pairs_count(n - x) * 2
end

if n.even?
  ans += pairs_count(n / 2) * pairs_count(n / 2)
end

puts ans
