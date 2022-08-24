n = gets.chomp.to_i

n_array = [1]

j = 2

while j <= n
  max_division_value = 1

  i = 2
  while i * i <= j
    div, mod = j.divmod(i)
    if mod == 0
      max_division_value = [n_array[div - 1], n_array[i - 1], max_division_value].max
    end
    i += 1
  end
  n_array << max_division_value + 1

  j += 1
end

puts n_array.join(' ')
