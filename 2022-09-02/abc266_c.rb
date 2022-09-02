X = 0
Y = 1

a = gets.chomp.split.map(&:to_i)
b = gets.chomp.split.map(&:to_i)
c = gets.chomp.split.map(&:to_i)
d = gets.chomp.split.map(&:to_i)

def outer_product(a, b, c)
  v1 = [a[X] - b[X], a[Y] - b[Y]]
  v2 = [c[X] - b[X], c[Y] - b[Y]]

  v2[X] * v1[Y]  - v2[Y] * v1[X]
end

puts outer_product(a, b, c) > 0 && outer_product(b, c, d) > 0 && outer_product(c, d, a) > 0 && outer_product(d, a, b) > 0 ? 'Yes' : 'No'
