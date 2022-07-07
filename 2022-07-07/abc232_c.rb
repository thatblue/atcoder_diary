# cf. https://atcoder.jp/contests/abc232/submissions/33007774
n, m = gets.chomp.split.map(&:to_i)

ab = Array.new(n) {Array.new(n, 0)}
cd = Array.new(n) {Array.new(n, 0)}

(1..m).each do
  a, b = gets.chomp.split.map(&:to_i)
  ab[a-1][b-1] = 1
  ab[b-1][a-1] = 1
end

(1..m).each do
  c, d = gets.chomp.split.map(&:to_i)
  cd[c-1][d-1] = 1
  cd[d-1][c-1] = 1
end

(0..(n - 1)).to_a.permutation.each do |p|
  rearranged_cd = Array.new(n) {Array.new(n, 0)}
  (0..(n - 1)).each do |i|
    (0..(n - 1)).each do |j|
      rearranged_i = p[i]
      rearranged_j = p[j]
      rearranged_cd[i][j] = cd[rearranged_i][rearranged_j]
    end
  end

  if ab == rearranged_cd
    puts "Yes"
    exit
  end
end

puts "No"