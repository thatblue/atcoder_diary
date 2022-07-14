formulas = gets.chomp.split('+')

replace_count = 0
formulas.each do |formula|
  if formula.include?("0")
    next
  end

  replace_count += 1
end

p replace_count