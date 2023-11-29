# cf. https://atcoder.jp/contests/abc323/submissions/46311372

n = gets.chomp.to_i

slimes = Hash.new(0)
ans = 0
n.times do
  size, count = gets.chomp.split.map(&:to_i)
  slimes[size] = count
  ans += count
end

slimes.keys.sort.each do |start_size|
  current_size = start_size

  while slimes[current_size] > 1 do
    size_2x = current_size * 2
    count_2x = slimes[current_size] / 2

    slimes[current_size] = slimes[current_size] % 2
    slimes[size_2x] += count_2x
    ans -= count_2x

    current_size = size_2x
  end
end

puts ans
