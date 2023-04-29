h, w = gets.chomp.split.map(&:to_i)

a_map = []
h.times do
  a_map << gets.chomp.chars
end

b_map = []
h.times do
  b_map << gets.chomp.chars
end

h.times do |i_shift|
  w.times do |j_shift|
    result = true
    h.times do |i|
      w.times do |j|
        if a_map[i][j] != b_map[(i + i_shift) % h][(j + j_shift) % w]
          result = false
          break
        end
      end
      break unless result
    end

    if result
      puts 'Yes'
      exit
    end
  end
end


puts 'No'
