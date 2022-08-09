VERY_LARGE_PRIME = 1000000007

n, m = gets.chomp.split.map(&:to_i)

def factorial(n)
  (2..n).inject(1) do|result, item|
    (result * item) % VERY_LARGE_PRIME
  end
end

if (n - m).abs > 1
  p 0
  exit
end

min, max = [n, m].minmax

min_factorial = factorial(min) % VERY_LARGE_PRIME

if n == m
  count = min_factorial ** 2 * 2
else
  count = min_factorial ** 2 * max
end

p count % VERY_LARGE_PRIME
