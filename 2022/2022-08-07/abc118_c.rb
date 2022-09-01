gets.chomp.to_i
array = gets.chomp.split.map(&:to_i)

gcd = array.shift

array.each do |current|
  gcd = gcd.gcd(current)
end

p gcd
