x, y = gets.chomp.split.map(&:to_i)

def positive_integer?(x)
    x.floor == x && x >= 0
end

a = 2 * x - y.to_f / 2
b = y.to_f / 2 - x

puts positive_integer?(a) && positive_integer?(b) ? 'Yes' : 'No'
