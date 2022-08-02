VERY_LARGE_PRIME = 10 ** 9 + 7

n = gets.chomp.to_i
array = gets.chomp.split.map(&:to_i)

if n <= 2
  p array[0] * n
  exit
end

prev1_fb = 2
prev2_fb = 1
prev_add = array[0] + array[1]
prev_sub = array[0] - array[1]

array.shift(2)

array.each do |current|
  prev_add, prev_sub =
    (prev_add + prev_sub + current * prev1_fb),
    (prev_add - current * prev2_fb)
  prev1_fb, prev2_fb = prev1_fb + prev2_fb, prev1_fb
end

p (prev_add + prev_sub) % VERY_LARGE_PRIME
