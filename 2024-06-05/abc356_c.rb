N, M, K = gets.chomp.split.map(&:to_i)

tests = []
M.times do
  _, *test, result = gets.chomp.split
  test_bitset = test.reduce(0) do |prev, current|
    prev + (1 << (current.to_i - 1))
  end
  tests << [test_bitset, result == 'o']
end

ans = 0
(2**N).times do |bitset|
  ans += 1 if tests.all? do |test_bitset, result|
    # 今検証したい鍵のセットと結果の突き合わせ
    bit = bitset & test_bitset
    (bit.to_s(2).count('1') >= K) == result
  end
end

puts ans
