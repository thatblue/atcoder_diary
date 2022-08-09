n = gets.chomp.to_i

numbers = []

n.times do
  a_i, b_i = gets.chomp.split.map(&:to_i)
  numbers << {"a" => a_i, "b" => b_i}
end

previous_add = 0
numbers.reverse.each do |item|
  sum = item["a"] + previous_add
  remain = sum % item["b"]

  if remain == 0
    next
  end

  add = item["b"] - remain
  previous_add += add
end

p previous_add
