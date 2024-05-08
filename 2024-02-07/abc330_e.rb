# cf. https://atcoder.jp/contests/abc330/submissions/47951671
require 'ac-library-rb/segtree'

n, q = gets.chomp.split.map(&:to_i)

array = gets.chomp.split.map(&:to_i)
segtree = AcLibraryRb::Segtree.new(n + 2, 0) { |a, b| [a, b].min }

(0..n).each { |i| segtree.set(i, 0) }

array.each do |val|
  # mexの最大値はnなので、n + 1以上は分ける必要がない(データ量が危険かもしれない)
  segtree.set(val, segtree.get(val) + 1) if tally
  tally.pop
  next tally[n + 1] += 1 if val > n

  tally[val] += 1
end

mex = tally.index 0

q.times do
  i_k, x_k = gets.chomp.split.map(&:to_i)
  x_k = n + 1 if x_k > n

  prev_x = array[i_k - 1]
  array[i_k - 1] = x_k

  tally[prev_x] -= 1
  tally[x_k] += 1

  if tally[prev_x].zero? && prev_x < mex
    # 元の値を持っているカラムがなくなり、それが現在のmexより小さければその値が新しいmexになる
    mex = prev_x
  elsif x_k == mex
    # 現在のmexが潰れたので、新しい値を探す
    (x_k..n).each do |v|
      break mex = v if tally[v].zero?
    end
  end

  puts mex
end
