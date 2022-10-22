MOD = 10 ** 5
n, k = gets.chomp.split.map(&:to_i)

if n == 0
  p 0
  exit
end

first_time_index = {}
x = n

first_time_index[n] = 0
1.upto(k) do |i|
  y = x.to_s.chars.map(&:to_i).sum
  x = (x + y) % MOD
  if first_time_index.has_key?(x)
    remain_count = k - i
    loop_length = i - first_time_index[x]
    x = first_time_index.key(first_time_index[x] + (remain_count % loop_length))
    break
  end

  first_time_index[x] = i
end

puts x
