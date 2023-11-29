n = gets.chomp.to_i
n_digits = n.to_s.length

def combine_digit(a, b)
  a.to_s + b.to_s
end

candidates_753 = ['3', '5', '7']
digits = 2
while n_digits >= digits do
  next_numbers = {}

  candidates_753.each do |current_number|
    [3, 5, 7].each do |add_number|
      next_numbers[combine_digit(current_number, add_number)] = true
      next_numbers[combine_digit(add_number, current_number)] = true
    end
  end

  candidates_753 += next_numbers.keys
  digits += 1
end

numbers_753 = []
candidates_753.each do |candidate|
  next unless candidate.index('3')
  next unless candidate.index('5')
  next unless candidate.index('7')
  numbers_753 << candidate.to_i
end

numbers_753.uniq!
numbers_753.sort!

puts numbers_753.bsearch_index { |v| v > n } || numbers_753.length
