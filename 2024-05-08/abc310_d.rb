# cf. https://atcoder.jp/contests/abc310/editorial/6783 (解法1)
N, T, M = gets.chomp.split.map(&:to_i)

@allowed_same_team = Array.new(N) { Array.new(N, true) }
M.times do
  a, b = gets.chomp.split.map(&:to_i)
  @allowed_same_team[a - 1][b - 1] = false
  @allowed_same_team[b - 1][a - 1] = false
end

@teams = []
def dfs(current)
  return @teams.size == T ? 1 : 0 if current == N

  ans = 0
  # 既にあるチームに追加する
  @teams.each_with_index do |team, index|
    next unless team.all? { |member| @allowed_same_team[current][member] }

    @teams[index] << current
    ans += dfs(current + 1)
    @teams[index].pop
  end

  # チーム数に余裕があれば、新しいチームを作る
  if @teams.size < T
    @teams << [current]
    ans += dfs(current + 1)
    @teams.pop
  end

  ans
end

puts dfs(0)
