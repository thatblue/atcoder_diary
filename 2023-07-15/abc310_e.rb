n = gets.chomp.to_i
s = gets.chomp

s_array = s.chars.map(&:to_i)

def nand(a, b)
  a + b == 2 ? 0 : 1
end

current_array = s_array
ans = 0

n.times do
  value = current_array.shift
  ans += value

  current_array.each do |bit|
    value = nand(value, bit)
    ans += value
  end
end

puts ans
