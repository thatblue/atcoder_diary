# cf. https://atcoder.jp/contests/dp/submissions/22569990

N = gets.chomp.to_i
a = gets.chomp.split.tally
a.default = 0

DP = Array.new(a["3"] + 1) {Array.new(a["3"] + a["2"] + 1) {Array.new(a["3"] + a["2"] + a["1"] + 1)}}

DP[0][0][0] = 0.0

def expected(i, j, k)
  return DP[i][j][k] if DP[i][j][k]

  sum = N
  sum += expected(i - 1, j + 1, k) * i if i > 0
  sum += expected(i, j - 1, k + 1) * j if j > 0
  sum += expected(i, j, k - 1) * k if k > 0

  DP[i][j][k] = sum / (i + j + k)
end

p expected(a["3"], a["2"], a["1"])
