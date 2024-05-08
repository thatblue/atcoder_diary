n, m = gets.chomp.split.map(&:to_i)
words = []

ok = 0 # 横幅の最大値がほしい
ng = 0 # 横幅の最小値がほしい
gets.chomp.split.each do |v|
  char_count = v.to_i + 1
  words << char_count

  ok += char_count
  ng = [char_count, ng].max
end

ng -= 2

while ng + 1 < ok # ng とokが隣り合ったらbreak
  center = (ok + ng) / 2 # 検証したいウィンドウの横幅

  line_count = 1
  line_length = 0
  words.each do |word|
    line_length += word
    if line_length > center
      line_count += 1
      line_length = word
    end
  end

  if line_count > m
    # 規定行数に収まらなかったのでウィンドウの横幅を広げないといけない
    ng = center
  else
    ok = center
  end
end

puts ok - 1
