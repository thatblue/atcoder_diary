n = gets.chomp.to_i

def recursive_func(x)
  if x < 2
    return 1
  end

  x * recursive_func(x - 1)
end

if n < 2
  p 1
  exit
end

p n * recursive_func(n - 1)