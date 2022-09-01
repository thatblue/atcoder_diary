x, y, n = gets.chomp.split.map(&:to_i)

if x * 3 < y
  p x * n
else
  div, remain = n.divmod(3)
  p y * div + x * remain
end
