# cf. https://atcoder.jp/contests/typical90/submissions/22169559

ALPHA_START = 'a'.ord
ALPHA_LENGTH = 'z'.ord - ALPHA_START + 1
n, k = gets.chomp.split.map(&:to_i)

s = gets.chomp.chars

## (1) 事前のデータ作成
# nex[i][j] はj番目のアルファベットがi文字目以降何番目に現れるかを示す (初期値として適当にn-1より大きい値を入れておく)
nex = Array.new(n) { Array.new(ALPHA_LENGTH, n + 1) }

# 「このアルファベットがこの先何文字目で出現するか」を知りたいので、文字列末尾から走査していく
(n - 1).downto(0) do |i|
  alpha_order = s[i].ord - ALPHA_START
  # i番目に出現する文字の値をセットする
  nex[i][alpha_order] = i
  # 配るDP的な処理をしているので、先頭に到達したらそのまま終わり
  break if i.zero?

  # 次に走査する箇所に初期値として現在の行の値をセットしておく
  ALPHA_LENGTH.times do |j|
    nex[i - 1][j] = nex[i][j]
  end
end

## (2) 答えとなる文字列を探す
ans = []
remaining = k
i = 0
j = 0
# k文字見つけるまで処理を繰り返す
while remaining.positive?
  # 必要な文字数以上後続の文字が残るのであれば、どんなに残りの文字数が少なくても辞書順に先に来る文字が優先になる
  if n - nex[i][j] >= remaining
    ans << (ALPHA_START + j).chr
    ## 発見したら残りの文字数を減らす
    remaining -= 1
    ## 見つけたnex[i][j]文字目以降で次の文字を探す
    i = nex[i][j] + 1
    j = 0
  else
    # 必要な文字数以上残らないのであれば次の文字を探す
    j += 1
  end
end

# 最後まで走査が終わって見つかった文字列が答えになる
puts ans.join
