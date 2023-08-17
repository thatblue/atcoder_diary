include Math

n, m = gets.chomp.split.map(&:to_i)

# mがn**2より大きい場合は解が出せない(それ以外だと最悪でもn**2が答えになる)
if n * n < m
  puts -1
  exit
end

min = n * n
a_max = Math.sqrt(m).to_i # Math.sqrt(m)まで調べればmの約数の範囲を全部確認できる

1.upto(a_max) do |a|
  b_min, mod = m.divmod(a)
  b_min += 1 if mod.positive?

  b_min.upto(n) do |b|
    break if a * b >= min

    min = [min, a * b].min
  end

  break if min == m
end

puts min
