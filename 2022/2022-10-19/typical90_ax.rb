VERY_LARGE_PRIME = 10 ** 9 + 7
n, l = gets.chomp.split.map(&:to_i)

div, mod = n.divmod(l)

def combination(n, r)
  if r == 0
    return 1
  end
  if r == 1
    return n
  end

  ((n - r + 1)..n).inject(:*) / (2..r).inject(:*)
end

sum = 0
0.upto(div) do |l_times|
  all_choices = l_times + (div - l_times) * l + mod
  sum += combination(all_choices, l_times)
  sum %= VERY_LARGE_PRIME
end

puts sum
