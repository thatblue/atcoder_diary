gets.chomp.to_i
puts gets.chomp.split.map { |v| v.to_i.even? ? v : nil }.compact.join " "
