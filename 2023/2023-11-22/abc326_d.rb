@n = gets.chomp.to_i
@r = gets.chomp
@c = gets.chomp

@memo = {}
def correct?(rows)
  grid_id = rows.flatten.join
  # return @memo[grid_id] if @memo.include?(grid_id)

  char_used = Hash.new { |hash, key| hash[key] = {} }
  rows.each_with_index do |row, i|
    row.each_with_index do |char, j|
      # 全ての列に A, B, C がちょうど 1 個ずつ含まれる
      next if char == '.'
      return @memo[grid_id] = false if char_used[char].include?(j)
      char_used[char][j] = true
    end
  end

  rows.transpose.each_with_index do |col, j|
    first_char = col.find { |v| v != '.' }
    next if first_char.nil?

    # 各列に書かれた最も上の文字は左から順に @c の内容である
    return @memo[grid_id] = false unless first_char == @c[j]
  end

  @memo[grid_id] = true
end

def dfs(row_index, prev_rows)
  first_char = @r[row_index]
  detected_rows = nil
  # 全ての行に A, B, C がちょうど 1 個ずつ含まれる
  (['A', 'B', 'C'] + Array.new(@n - 3, '.')).permutation.to_a.uniq.each do |order|
    order_first_char = order.find { |v| v != '.' }
    # 各行に書かれた最も左の文字は上から順に @r の内容である
    next unless first_char == order_first_char

    current_rows = prev_rows.map(&:dup)
    current_rows << order
    next unless correct?(current_rows)

    # pp current_rows

    return current_rows if row_index == @n - 1

    detected_rows = dfs(row_index + 1, current_rows)

    return detected_rows unless detected_rows.nil?
  end

  detected_rows
end

ans = dfs(0, [])

if ans.nil?
  puts 'No'
  exit
end

puts 'Yes'
ans.each do |row|
  puts row.join
end
