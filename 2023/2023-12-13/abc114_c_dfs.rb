N = gets.to_i
N_DIGITS = N.to_s.length
NUMBERS = ["3", "5", "7"]

@candidates = {}
def dfs(current_number, digits)
  return if digits > N_DIGITS

  NUMBERS.each do |add_digit|
    ["#{add_digit}#{current_number}", "#{current_number}#{add_digit}"].each do |candidate|
      next if @candidates.include?(candidate)

      @candidates[candidate] = true
      dfs(candidate, digits + 1)
    end
  end
end

dfs('', 0)

ans_numbers = []
@candidates.each_key do |candidate|
  next unless NUMBERS.all? { |n| candidate.include?(n) }

  ans_numbers << candidate.to_i
end

ans_numbers.uniq!
ans_numbers.sort!

puts ans_numbers.bsearch_index { |x| x > N } || ans_numbers.size
