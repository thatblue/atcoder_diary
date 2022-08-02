VERY_LARGE_PRIME = 10 ** 9 + 7

n = gets.chomp.to_i
array = gets.chomp.split.map(&:to_i)
array.unshift(0)

if n <= 2
  p array[1] * n
  exit
end

prev1_fb = 2
prev2_fb = 1
prev_add = array[1] + array[2]
prev_sub = array[1] - array[2]

array[3..-1].each do |current|
  prev_add, prev_sub = [
    (prev_add + prev_sub + current * prev1_fb) % VERY_LARGE_PRIME,
    (prev_add - current * prev2_fb) % VERY_LARGE_PRIME
  ]

  prev1_fb, prev2_fb = [prev1_fb + prev2_fb, prev1_fb]
end

p (prev_add + prev_sub) % VERY_LARGE_PRIME