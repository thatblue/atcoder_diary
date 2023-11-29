# 解説の写経
# cf. https://atcoder.jp/contests/abc319/editorial/7115
n, m = gets.chomp.split.map(&:to_i)
words = gets.chomp.split.map { |l|
  # 空白の処理のため、空白分の1文字を足しておく(先頭に付けるイメージ)
  l.to_i + 1
}

min = words.max - 1 # 最長の単語が最小値
max = words.sum # 全部並べたときの長さが最大値

while min + 1 < max
  middle = (min + max) / 2

  rows = 1
  row_length = 0
  n.times do |i|
    row_length += words[i]
    if row_length > middle
      rows += 1
      row_length = words[i]
    end
  end

  if rows > m
    min = middle
  else
    max = middle
  end
end

# 先頭に付けた1文字を削った値が答えになる
puts max - 1
