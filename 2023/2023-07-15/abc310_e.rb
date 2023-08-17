# https://atcoder.jp/contests/abc310/editorial/6784 解説の写経

gets.chomp.to_i
s = gets.chomp.chars.map(&:to_i)

prev_zero = 0
prev_one = 0
ans = 0
s.each do |char|
  # f(*, i)をDPで解いていくイメージ
  if char.zero?
    # 現在の値が0: 手前の値に関わらず1になり、自分が先頭の場合のみ0となる
    current_zero = 1
    current_one = prev_zero + prev_one
  else
    # 現在の値が1: 手前の値が0なら1、1なら0になり、自分が先頭の場合は1となる
    current_zero = prev_one
    current_one = prev_zero + 1
  end

  ans += current_one

  prev_zero = current_zero
  prev_one = current_one
end

puts ans
