a = gets.chomp.to_i

def func(x)
  scales = x.to_s.chars.map!(&:to_i).reverse
  value = 0
  scales.each_with_index do |item, i|
    value += item * x ** i
  end

  value
end

(10..10000).each do |x|
  func_x = func(x)
  if a == func_x
    p x
    exit
  end

  if a < func_x
    break
  end
end

p -1
