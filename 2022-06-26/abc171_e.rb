def int_xor (a, b)

end

n = gets.chomp.to_i

a = gets.split(' ').map!(&:to_i)

numbers = []
all_xor = a.inject(0) { |result, item| result ^ item }

(0..n-1).each do |index|
  numbers.push(a[index] ^ all_xor)
end

print numbers.join(' ')