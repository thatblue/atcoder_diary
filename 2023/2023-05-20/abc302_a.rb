a, b = gets.chomp.split.map(&:to_i)

div, mod = a.divmod(b)

puts div + (mod.positive? ? 1 : 0)
