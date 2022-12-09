x, expiry, ate = gets.chomp.split.map(&:to_i)

if ate <= expiry
  puts 'delicious'
elsif ate <= expiry + x
  puts 'safe'
elsif ate > expiry + x
  puts 'dangerous'
end

