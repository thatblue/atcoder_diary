n, k, q = gets.split(' ').map!(&:to_i)
a = gets.split(' ').map!(&:to_i)
l = gets.split(' ').map!(&:to_i)

l.each do |index|
  i = index - 1
  if a[i] == n
    next
  end

  if i == k - 1 || a[i + 1] - a[i] > 1
    a[i] += 1
  end
end

print a.join(' ')