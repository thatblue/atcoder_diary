# cf. https://atcoder.jp/contests/abc317/editorial/7043 解説の写経
n = gets.chomp.to_i

seats_max = 0
takahashi_seats = 0
areas = []
n.times do
  takahashi, aoki, seats = gets.chomp.split.map(&:to_i)
  seats_max += seats
  takahashi_seats += seats if takahashi > aoki

  areas << {
    :voter_sum => takahashi + aoki,
    :takahashi => takahashi,
    :aoki => aoki,
    :seats => seats,
  }
end

majority_min = seats_max / 2 + 1

if majority_min <= takahashi_seats
  puts 0
  exit
end

dp = Array.new(seats_max + 1, Float::INFINITY)
dp[0] = 0

areas.each do |area|
  settoku_count = [0, area[:voter_sum] / 2 + 1 - area[:takahashi]].max
  seats_max.downto(area[:seats]) do |j|
    dp[j] = [dp[j], dp[j - area[:seats]] + settoku_count].min
  end
end

puts dp[majority_min..].min
