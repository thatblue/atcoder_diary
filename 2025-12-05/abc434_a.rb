w, b = gets.chomp.split.map(&:to_i)

w_gram = w * 1000

baloons, mod = w_gram.divmod(b)

puts baloons + 1