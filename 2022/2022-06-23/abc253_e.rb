n, m, k = gets.split.map!(&:to_i)

array_count = 0

tolerance = k
loop do
  an_min = 1 + tolerance * (n - 1)

  if an_min > m
    break
  end

  tolerance_multiples, remain = m.divmod(tolerance)
  array_count += (m - an_min) + 1

  tolerance += 1
end

p array_count % 998244353