N = gets.to_i
N_DIGITS = N.to_s.length
NUMBERS = ["3", "5", "7"]

candidates = NUMBERS
current_numbers = NUMBERS
digits = 1
while digits < N_DIGITS
  next_numbers = {}

  current_numbers.each do |current|
    NUMBERS.each do |add_digit|
      next_numbers["#{add_digit}#{current}"] = true
      next_numbers["#{current}#{add_digit}"] = true
    end
  end
  current_numbers = next_numbers.keys
  candidates += current_numbers
  digits += 1
end

ans_numbers = []
candidates.each do |candidate|
  next unless NUMBERS.all? { |n| candidate.include?(n) }

  ans_numbers << candidate.to_i
end

ans_numbers.uniq!
ans_numbers.sort!

puts ans_numbers.bsearch_index{|x| x > N } || ans_numbers.size
