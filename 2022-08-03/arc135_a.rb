VERY_LARGE_PRIME = 998244353

x = gets.chomp.to_i

if x <= 4
  p x
  exit
end

x_stack = [x]

fragments = {2 => 0, 3 => 0, 4 => 0}

loop do
  max_x = x_stack.pop
  if max_x.nil?
    break
  end

  x_floor = max_x / 2
  x_ceil = (max_x.to_f / 2).ceil

  if x_floor > 4
    x_stack.push(x_floor)
  else
    fragments[x_floor] += 1
  end

  if x_ceil > 4
    x_stack.push(x_ceil)
  else
    fragments[x_ceil] += 1
  end
end

p (2 ** fragments[2]  % VERY_LARGE_PRIME) * (3 ** fragments[3]  % VERY_LARGE_PRIME) * (4 ** fragments[4] % VERY_LARGE_PRIME) % VERY_LARGE_PRIME
