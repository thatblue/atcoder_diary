n = gets.chomp.to_i.to_s(2).chars.map(&:to_i)
n_length = n.count
count_of_1 = n.count(1)

(2 ** count_of_1).times do |current|
  current_mask = current.to_s(2).rjust(count_of_1, "0").chars.map(&:to_i)
  masked_value = []
  n.each do |value|
    if value == 1
      masked_value << current_mask.shift
    else
      masked_value << 0
    end
  end

  puts masked_value.join.to_i(2).to_s(10)
end
