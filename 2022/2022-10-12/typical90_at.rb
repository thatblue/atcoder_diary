LUCKY_NUMBER = 46
gets.chomp.to_i

a_array = gets.chomp.split.map{ |value| value.to_i % LUCKY_NUMBER }.sort.tally
b_array = gets.chomp.split.map{ |value| value.to_i % LUCKY_NUMBER }.sort.tally
c_array = gets.chomp.split.map{ |value| value.to_i % LUCKY_NUMBER }.sort.tally

sum = 0
a_array.each do |a_value|
  a_mod, a_count = a_value
  b_array.each do |b_value|
    b_mod, b_count = b_value
    c_array.each do |c_value|
      c_mod, c_count = c_value
      if (a_mod + b_mod + c_mod) % LUCKY_NUMBER > 0
        next
      end
      sum += a_count * b_count * c_count
    end
  end
end

p sum
