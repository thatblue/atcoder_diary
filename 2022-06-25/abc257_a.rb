n, x = gets.split(' ').map!(&:to_i)

order, remain = x.divmod(n)

if remain == 0
  print ('A'.ord + (order - 1)).chr
else
  print ('A'.ord + order).chr
end

