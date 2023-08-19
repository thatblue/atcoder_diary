h, w = gets.chomp.split.map(&:to_i)

cookies = []
i_colors = Hash.new {|hash, key| hash[key] = Hash.new(0) }
j_colors = Hash.new {|hash, key| hash[key] = Hash.new(0) }
h.times do |i|
  row = gets.chomp.chars
  cookies << row
  row.each_with_index do |color, j|
    i_colors[i][color] += 1
    j_colors[j][color] += 1
  end
end

current_h = h
current_w = w
marked_rows = {}
marked_cols = {}

(h + w).times do
  checked_rows = {}
  checked_cols = {}

  h.times do |i|
    next if marked_rows[i]
    ('a'..'z').each do |char|
      if i_colors[i][char] == current_w && current_w >= 2
        checked_rows[[i, char]] = true
      end
    end
  end

  w.times do |j|
    next if marked_cols[j]
    ('a'..'z').each do |char|
      if j_colors[j][char] == current_h && current_h >= 2
        checked_cols[[j, char]] = true
      end
    end
  end

  checked_rows.keys.each do |i, char|
    marked_rows[i] = true
    w.times { |j| j_colors[j][char] -= 1 }
    current_h -= 1
  end

  checked_cols.keys.each do |j, char|
    marked_cols[j] = true
    h.times { |i| i_colors[i][char] -= 1 }
    current_w -= 1
  end
end

puts current_h * current_w
