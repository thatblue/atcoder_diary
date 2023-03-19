n, m = gets.chomp.split.map(&:to_i)

a_array = gets.chomp.split.map(&:to_i)
b_array = gets.chomp.split.map(&:to_i)

a_index = 0
b_index = 0
c_length = n + m

a_orders = Array.new(n)
b_orders = Array.new(m)

1.upto(c_length) do |current_order|
  if a_index >= n
    b_orders[b_index] = current_order
    b_index += 1
    next
  end

  if b_index >= m
    a_orders[a_index] = current_order
    a_index += 1
    next
  end

  if a_array[a_index] < b_array[b_index]
    a_orders[a_index] = current_order
    a_index += 1
  else
    b_orders[b_index] = current_order
    b_index += 1
  end
end

puts a_orders.join ' '
puts b_orders.join ' '
