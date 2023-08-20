# cf. https://atcoder.jp/contests/abc315/submissions/44745288
h, w = gets.chomp.split.map(&:to_i)

cookies = []
i_colors = Array.new(h) { Hash.new(0) }
j_colors = Array.new(w) { Hash.new(0) }
h.times do |i|
  row = gets.chomp.chars.map {|c| c.ord - 97}
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

rows = [*0...h]
cols = [*0...w]
updated = true

while updated && rows.size > 1 && cols.size > 1
  # 行と列をそれぞれチェックして、印を付けられる箇所を除外していく
  excluded_row_chars = []
  rows, _ = rows.partition do |i|
    color = i_colors[i]
    next true if color.size > 1

    excluded_row_chars << color.keys.first
    false
  end

  excluded_col_chars = []
  cols, _ = cols.partition do |j|
    color = j_colors[j]
    next true if color.size > 1

    excluded_col_chars << color.keys.first
    false
  end

  # 相手方から除外した文字を消し込む
  excluded_row_chars.each do |char|
    cols.keep_if do |j|
      color = j_colors[j]
      color[char] -= 1
      color.delete(char) if color[char] == 0
      color.size > 0
    end
  end

  excluded_col_chars.each do |char|
    rows.keep_if do |i|
      color = i_colors[i]
      color[char] -= 1
      color.delete(char) if color[char] == 0
      color.size > 0
    end
  end

  updated = excluded_row_chars.size > 0 || excluded_col_chars.size > 0
end

puts rows.size * cols.size
