n, m, x, t, d = gets.chomp.split.map(&:to_i)

if m >= x
  p t
  exit
end

p t - d * (x - m)
