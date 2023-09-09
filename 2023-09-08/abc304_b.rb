n = gets.chomp.to_i

num = 10**3
i = 1
while num < 10**9
  if n < num
    puts n
    exit
  end

  n = (n / 10 ** i) * 10 ** i
  i += 1
  num *= 10
end

puts n
