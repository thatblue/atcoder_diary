# cf. https://atcoder.jp/contests/abc298/submissions/40652274

VERY_LARGE_PRIME = 998244353
q = gets.chomp.to_i

nums = [1]
current_ans = 1
q.times do
  query = gets.chomp.split.map(&:to_i)

  if query[0] == 1
    current_ans = (current_ans * 10 + query[1]) % VERY_LARGE_PRIME
    nums << query[1]
  elsif query[0] == 2
    drop_num = nums.shift
    current_ans = (current_ans - 10.pow(nums.length, VERY_LARGE_PRIME) * drop_num) % VERY_LARGE_PRIME
  else
    puts current_ans
  end
end
