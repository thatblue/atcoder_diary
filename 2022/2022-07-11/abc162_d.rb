# cf, https://atcoder.jp/contests/abc162/submissions/31766889

n = gets.chomp.to_i
s = gets.chomp.chars

s_tally = s.tally
s_tally.default = 0

triplet_count  = s_tally["R"] * s_tally["G"] * s_tally["B"]

if triplet_count == 0
  p triplet_count
  exit
end

(0..(n-3)).each do |i|
  (i + 1.. (n-2)).each do |j|
    next if i == j
    k = j * 2 - i
    break if k >= n

    if [s[i], s[j], s[k]].uniq.size == 3
      triplet_count -= 1
    end
  end
end

p triplet_count
