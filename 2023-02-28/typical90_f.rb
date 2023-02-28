# cf. https://atcoder.jp/contests/typical90/submissions/22169559

ALPHA_START = 'a'.ord
ALPHA_LENGTH = 'z'.ord - ALPHA_START + 1
n, k = gets.chomp.split.map(&:to_i)

s = gets.chomp.chars

nex = Array.new(n) { Array.new(ALPHA_LENGTH, n + 1) }

(n - 1).downto(0) do |i|
  alpha_order = s[i].ord - ALPHA_START
  nex[i][alpha_order] = i
  break if i.zero?

  ALPHA_LENGTH.times do |j|
    nex[i - 1][j] = nex[i][j]
  end
end

ans = []
remaining = k
i = 0
j = 0
while remaining.positive?
  if n - nex[i][j] >= remaining
    ans << (ALPHA_START + j).chr
    remaining -= 1
    i = nex[i][j] + 1
    j = 0
  else
    j += 1
  end
end

puts ans.join
