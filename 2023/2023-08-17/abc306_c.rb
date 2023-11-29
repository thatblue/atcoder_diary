n = gets.chomp.to_i
array = gets.chomp.split.map(&:to_i)

first_pos = {}
second_pos = {}
array.each_with_index do |a_i, i|
  next if first_pos.include?(a_i) && second_pos.include?(a_i)

  unless first_pos.include?(a_i)
    first_pos[a_i] = i + 1
    next
  end

  unless second_pos.include?(a_i)
    second_pos[a_i] = i + 1
  end
end

puts second_pos.sort_by { |k, v| v }.map { |k, v| k }.join ' '
