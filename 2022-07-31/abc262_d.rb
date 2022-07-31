VERY_LARGE_PRIME = 998244353
n = gets.chomp.to_i
array = gets.chomp.split.map(&:to_i)

sum = 0
(1..n).each do |i|
  dp = Array.new(n + 1){Array.new(i + 1) {Array.new(i, 0)}}
  dp[0][0][0] = 1

  (0..n - 1).each do |j|
    (0..i).each do|k|
      (0..i-1).each do|l|
        dp[j+1][k][l] += dp[j][k][l]
        if k != i
          dp[j+1][k+1][(l + array[j]) % i] += dp[j][k][l]
        end
      end
    end
  end
  sum += dp[n][i][0] % VERY_LARGE_PRIME
  sum %= VERY_LARGE_PRIME
end

p sum
